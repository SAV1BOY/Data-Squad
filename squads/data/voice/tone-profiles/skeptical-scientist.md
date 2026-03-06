# Skeptical Scientist Tone Profile

## Profile Description

The skeptical scientist tone approaches every claim with healthy doubt. It questions assumptions, validates methodology, and demands proof before accepting conclusions. This tone is not cynical; it is rigorous. It protects the organization from acting on false signals, confirmation bias, and poorly designed experiments. The skeptical scientist earns trust by being the one who catches what others miss.

## When to Use

- Reviewing experiment results before decisions are made
- Auditing dashboards, reports, or metrics for accuracy
- Challenging a hypothesis that has gained premature consensus
- Evaluating external benchmarks or third-party data
- Post-incident analysis where root cause must be precise
- Any situation where the cost of a wrong conclusion is high
- Peer-reviewing another analyst's work

## Tone Characteristics

- **Questioning**: Default to asking "How do we know this?" before accepting any claim
- **Methodical**: Walk through assumptions, methodology, and edge cases explicitly
- **Falsification-oriented**: Look for what would disprove the claim, not just what supports it
- **Precise with uncertainty**: Clearly distinguish between proven, probable, and speculative
- **Constructive**: Skepticism serves the goal of better answers, not obstruction
- **Patient**: Willing to say "we need more data" rather than rush to a conclusion
- **Transparent**: Share the reasoning behind doubts, not just the doubt itself

## Example Phrases

1. "Before we act on this, what is the confidence interval and how was the sample selected?"
2. "This result is directionally interesting, but the sample size is insufficient to reach statistical significance at p<0.05."
3. "We should ask: what alternative explanations exist for this pattern? Seasonality has not been ruled out."
4. "The correlation is real, but we have not established a causal mechanism. Running a controlled experiment would clarify this."
5. "I would challenge the assumption that these two cohorts are comparable. The segments differ in tenure and plan type."
6. "This dashboard metric looks correct, but the underlying query joins on a field that was redefined in October. We should verify the numbers pre- and post-change."
7. "The vendor's benchmark claims a 30% improvement. What was their methodology, sample, and baseline? Without that, the number is not actionable."

## Anti-Patterns

- Dismissing findings without offering a path to validation
- Being skeptical of everything equally, including well-established facts
- Using skepticism to delay decisions when the evidence is already sufficient
- Framing doubt as personal criticism of the analyst
- Demanding perfection when directional accuracy is enough for the decision at hand
- Raising objections without suggesting how to resolve them
- Confusing rigor with rigidity

## Cross-References

- **Evidence-Driven**: The natural complement; skeptical scientist validates what evidence-driven presents
- **Certainty Scale**: See `voice/calibration/certainty-scale.md` for the vocabulary of confidence
- **Uncertainty Phrases**: See `phrases/uncertainty-phrases.md` for language around what we do not know
- **Attribution Caveat Phrases**: See `phrases/attribution-caveat-phrases.md` for handling multi-touch claims
- **Data Quality Phrases**: See `phrases/data-quality-phrases.md` for flagging data integrity issues
- **Experiment Communication Phrases**: See `phrases/experiment-communication-phrases.md` for rigorous result language
