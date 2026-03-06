# Randomization and Bias Checklist

## Purpose

Ensure that experiment assignment is truly random, that treatment and control groups are comparable, and that common biases (contamination, novelty, selection) are identified and mitigated before results are interpreted.

---

## Checklist Items

### 1. Randomization Unit Is Appropriate

- **Pass:** The randomization unit (user, session, device, cluster) matches the unit of analysis. For features affecting shared resources (e.g., marketplace pricing), cluster randomization or switchback designs are used.
- **Fail:** Randomization is at session level but analysis is at user level, or individual randomization is used where interference between units exists.

### 2. Assignment Is Balanced and Verified

- **Pass:** Pre-experiment (AA test or SRM check) confirms that treatment and control groups are balanced on key covariates (traffic source, device type, tenure, geography). Sample Ratio Mismatch (SRM) test p-value is above 0.01.
- **Fail:** Group sizes differ from expected allocation by more than the SRM threshold, or covariate balance is not checked.

### 3. Assignment Is Persistent

- **Pass:** A user assigned to treatment on their first exposure remains in treatment for the entire experiment duration. Assignment is based on a stable identifier (user ID, device ID) hashed with the experiment salt.
- **Fail:** Users can switch groups between sessions, or assignment depends on volatile identifiers (e.g., cookies that get cleared).

### 4. Contamination Between Groups Is Prevented

- **Pass:** Treatment and control users cannot influence each other. For social or network products, contamination risk is assessed and mitigated (e.g., geo-based randomization, ego-network clustering).
- **Fail:** Treatment users share the new feature's output with control users (e.g., new message format visible to recipients in control), biasing the estimate toward zero.

### 5. Novelty and Primacy Effects Are Addressed

- **Pass:** The analysis plan includes a time-windowed analysis to detect novelty effects (initial spike that fades) or primacy effects (resistance to change that fades). Metrics are plotted by day-since-exposure.
- **Fail:** Only aggregate results are reported, masking temporal patterns that could reverse the conclusion.

### 6. Selection Bias in Triggering Is Controlled

- **Pass:** If the experiment only triggers on a subset of users (e.g., those who reach a specific page), the analysis population matches the triggered population. Intent-to-treat and per-protocol analyses are both reported when applicable.
- **Fail:** Analysis includes users who were assigned but never exposed, diluting the effect estimate without acknowledgment.

### 7. External Confounds During the Experiment Are Logged

- **Pass:** A log of external events during the experiment period (promotions, outages, holidays, competitor actions, PR events) is maintained. The analysis assesses whether these confounds disproportionately affected one group.
- **Fail:** An external event impacts results but is not documented, leading to incorrect attribution of the effect to the treatment.

### 8. Bucketing Logic Is Code-Reviewed and Tested

- **Pass:** The hashing/bucketing function is unit-tested to confirm uniform distribution across buckets. The experiment salt is unique per experiment to avoid correlated assignments across experiments.
- **Fail:** Bucketing code has not been reviewed, or the same salt is reused across experiments, creating hidden correlations.

---

## Cross-References

- [Sample Size and MDE](sample-size-and-mde.md) -- Bias reduces effective power; contamination inflates required sample size.
- [Sequential Testing QA](sequential-testing-qa.md) -- Peeking at results introduces a different kind of bias.
- [Decision Rubric](decision-rubric.md) -- Detected bias should lower confidence in the decision.
