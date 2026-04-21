# CFA-CLAUDE.md

Behavioral guidelines for Claude Code on financial, quantitative, or investment research work. Written for CFA charterholders, quant teams, and finance engineers who ship logic that touches real money. Merge with your project CLAUDE.md.

**Tradeoff:** These rules bias toward institutional rigor over engineering speed. A 5-day backtest becomes a 7-day backtest with audit trails. Worth it if the output ever touches client money, a regulatory filing, or published research.

## 1. Time Discipline

**No information travels backward in time.**

- Every feature at date T uses only data available at T. Use `.shift(1)` or explicit as-of joins. Never `df['ma'] = df['price'].rolling(30).mean()` without a lag.
- Train/test splits are temporal, never random. Walk-forward only. Declare purge and embargo gaps before training.
- Timestamps are tz-aware. Naive datetime on market data is a bug.
- State lookback and horizon in code: `# lookback=60, predict=20, shift=1`.

The test: can a future update to your price database change a past backtest result? If yes, you have leakage.

## 2. Source of Truth

**Every data point has a vendor, a schema, and a vintage. Name all three.**

- Every loader declares vendor (yfinance, Alpaca, Polygon, Bloomberg, internal), field semantics (adjusted_close vs close vs last), and as-of date.
- Never silently accept `close` — verify split-adjusted, dividend-adjusted, or raw.
- Multi-source fallbacks are logged, not hidden. If yfinance fails and Alpaca serves, the output records which one.
- Cached files keep their provenance. Don't let parquet lose its source stamp.

The test: if an auditor asks "where did AAPL's 2023-06-14 close come from," can you answer in under 60 seconds?

## 3. Risk Before Returns

**No return figure travels alone.**

- Every return number ships with Sharpe, Sortino, max drawdown, and Calmar.
- Holdout stays dark until the final run. No peeking, no re-tuning on holdout.
- Minimum 12 months OOS for any strategy claim. Prefer 24+ months.
- Never use "outperforms" or "beats benchmark" without t-stat, DSR, or bootstrap CIs.

The test: if you delete the total-return number from your report, is it still publishable? If not, you're over-indexed on returns.

## 4. Compliance by Default

**Code reads like research, not a trade recommendation.**

- Comments, logs, variable names, and UI strings avoid "buy", "sell", "recommend", "outperform" in contexts a client might see. Use "signal", "weight", "allocation".
- Every public-facing output (PDF, HTML, API response) includes a "Not investment advice. Past performance does not guarantee future results." footer.
- Model outputs are framed as signals or probabilities, never prescriptions.
- If a number could be misread as a price target, wrap it in explicit context.

The test: could you hand this repo to a compliance officer tomorrow without editing anything?

## 5. Institutional Reproducibility

**A result you can't regenerate in six months is a result you don't have.**

Every run that produces a research artifact, signal, or backtest:
- Pins seeds: `random`, `numpy`, `torch`, and any stochastic library.
- Snapshots data vintage: which date of data, which vendor, which version.
- Records the git SHA in the output file or DB row.
- Locks the environment: `uv.lock`, `requirements.lock`, or a container digest.
- Logs every decision, not just inputs and outputs. Why was this ticker filtered? Why did this rebalance skip?
- Fallbacks are never silent. If the system degraded (stale data, missing vendor), the output row says so.

The test: can a colleague in six months check out your git SHA, run one command, and get the exact same number? If not, it isn't reproducible.

---

**These guidelines are working if:** your backtests don't surprise you in production, your research notes can be handed to a regulator, and your code survives the "what data were you using on the day you got that Sharpe" question.
