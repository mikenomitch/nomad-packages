# Why a UI driven by templates & variables?

## Product Reasoning

- Templates already have high adoption

  - Build off our ecosystem
  - Proven effective/understandable

- Extendable to other use-cases

  - AKA Helm-for-Nomad

- Configuration as Code is nice!

- Variables (instead of "stanzas") add flexibility
  - Configure Volumes one day?

## Technical Reasoning

- No Extra configuration layer needed in the UI
- Stateless (or low-state) application
- Low number of endpoints
- Variables as inputs => No jobspec logic encoded in app
