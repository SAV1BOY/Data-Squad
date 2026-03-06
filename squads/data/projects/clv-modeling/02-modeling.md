# CLV Modeling - Modeling

## Phase Objective

Select the appropriate CLV modeling methodology, fit the model to the prepared data, validate predictions against held-out actuals, and produce a production-ready model that generates reliable customer-level lifetime value predictions.

## Prerequisites

- Clean, feature-engineered modeling dataset from Phase 01 with train/validation/test splits
- CLV definition (time horizon, revenue components) confirmed from Phase 00
- Understanding of the business model type (contractual vs. non-contractual, continuous vs. discrete)
- Computing resources for model training (adequate for the dataset size and algorithm complexity)
- Baseline prediction to benchmark against (e.g., historical average CLV or simple heuristic)

## Steps

1. **Select the Modeling Approach**: Choose the methodology that matches the business model. For non-contractual settings (retail, marketplace) where customers can transact at any time and churn is unobserved, probabilistic models like BG/NBD (Beta-Geometric/Negative Binomial Distribution) for purchase frequency combined with Gamma-Gamma for monetary value are well-established. For contractual settings (SaaS subscriptions) where churn is observed, survival models or discrete-time hazard models are appropriate. For complex settings with rich feature data, machine learning approaches (gradient boosting, neural networks) may capture non-linear relationships that parametric models miss.

2. **Build the Baseline Model**: Before fitting sophisticated models, establish a baseline prediction. Common baselines include predicting that each customer's future value equals their historical average, using a simple recency-frequency-monetary heuristic, or applying a flat retention rate assumption. The baseline provides a minimum performance threshold that any model must beat to justify its complexity.

3. **Fit the Probabilistic Model**: If using BG/NBD + Gamma-Gamma (common for non-contractual businesses), fit the BG/NBD model to transaction frequency and recency data to predict the expected number of future transactions. Then fit the Gamma-Gamma model to monetary values to predict the expected average transaction value. Multiply the two predictions and apply a discount rate to calculate present-value CLV. Validate model assumptions by checking the distribution fit against observed data.

4. **Fit the Machine Learning Model**: If using a supervised learning approach, train the model to predict the target variable (actual CLV over the defined horizon) using the engineered features. Start with gradient boosted trees (XGBoost, LightGBM) as they handle mixed feature types well and provide feature importance. Tune hyperparameters using the validation set. Avoid overfitting by monitoring validation performance during training and applying regularization.

5. **Compare Model Performance**: Evaluate all candidate models on the held-out test set using the metrics defined in the brief: mean absolute error (MAE), mean absolute percentage error (MAPE), and rank correlation (Spearman) between predicted and actual CLV. Also evaluate at the segment level: does the model correctly rank the top 10% of customers? Does it accurately distinguish high-value from low-value customers? A model with moderate point-estimate accuracy but strong ranking performance may be more useful than one with lower MAE but poor ranking.

6. **Analyze Feature Importance**: For the selected model, examine which features contribute most to predictions. In tree-based models, use SHAP values to understand both global feature importance and individual prediction explanations. Verify that the most important features make business sense. If the model relies heavily on a feature that is volatile, unreliable, or unavailable in production, address this dependency before deployment.

7. **Calibrate Prediction Intervals**: Point estimates of CLV are less useful than ranges. Generate prediction intervals that communicate uncertainty. For probabilistic models, use the parameter distributions to generate percentile predictions (e.g., 25th, 50th, 75th percentile CLV). For machine learning models, use techniques like quantile regression or conformal prediction to generate calibrated intervals. Verify that the stated confidence levels match observed coverage on the test set.

8. **Validate Against Business Intuition**: Present model predictions for a sample of well-known customers to stakeholders who know these accounts. Ask whether the predicted CLV and the driving factors match their expectations. If the model predicts high CLV for a customer the business knows is dissatisfied, investigate whether the model is missing important signals or whether the stakeholder's intuition is outdated.

9. **Prepare for Production Deployment**: Package the final model for production use. Document the model version, training data characteristics, feature requirements, prediction output format, and known limitations. Create a scoring pipeline that can generate predictions on demand or on a scheduled batch basis. Implement logging that captures every prediction for future monitoring and retraining.

## Deliverables

- Model selection rationale document explaining why the chosen approach fits the business model
- Baseline model performance metrics for benchmarking
- Trained model artifacts ready for production deployment
- Model performance report on test set with MAE, MAPE, rank correlation, and segment-level accuracy
- Feature importance analysis with SHAP values and business interpretation
- Prediction interval calibration report showing coverage at stated confidence levels
- Stakeholder validation summary confirming predictions pass intuition checks
- Production scoring pipeline documentation with input/output specifications

## Quality Gate

Modeling is complete when all of the following conditions are met:

- The selected model outperforms the baseline on the held-out test set by a meaningful margin
- Test set MAE and MAPE are within the acceptable thresholds defined in the brief
- Rank correlation between predicted and actual CLV exceeds 0.6 on the test set
- The model correctly identifies at least 70% of the top decile customers by actual CLV
- Feature importance analysis shows no reliance on leaky, unstable, or unavailable features
- Prediction intervals are calibrated within 5 percentage points of stated coverage
- Stakeholder validation confirms predictions are directionally reasonable for known accounts
- The production scoring pipeline is tested and produces consistent results

## Next Phase

Proceed to **03-segmentation.md** (Segmentation) to use CLV predictions to create customer segments and analyze the whale curve of value distribution.
