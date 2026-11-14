# Declaração de uso de IA

A IA foi utilizada como revisora e para tirar dúvidas. Não realizou tomada de decisções nem alteraçoes no código.

## Ferramenta e modelo

- **Ferramenta:** Claude Code (extensão do VS Code)
- **Modelo:** Claude Opus 5.5 (`claude-opus-5-5`)
- **Sessões:** 5 sessões entre 12/11 e 14/11/2026. As exportações estão nesta pasta (`sessao.md`).


## O que eu fiz

- Rodei `pytest -q` e usei os testes que falhavam para encontrar e corrigir, sem IA, quatro dos cinco defeitos:
  1. conversão de câmbio invertida (`currency_converter.py`);
  2. noites calculadas pelo dia do mês (`stay_calculator.py`);
  3. `NO_SHOW` contando nos totais (`status_policy.py`);
  4. ranking de hotéis em ordem crescente (`report_builder.py`).
  5. IA apontou o problema: Removi o limite de 200 linhas em `csv_reservation_repository.py` e adicionei o teste que verifica a leitura em todas as linhas. 
- Fiz todos os commits e decidi o que entraria na entrega.

## O que a IA fez

- **Ambiente:** Explicou por que o comando do README não rodava no meu terminal: eu tinha copiado o texto do Markdown renderizado, que trazia barras invertidas de escape (`\_`).
- **Verificação do `output/report.json`:** recalculou o relatório de forma independente, comparou com a saída do CLI e descobriu que só 200 das 300 reservas eram lidas. Mostrou a causa (`if len(rows) == 200: break`) e explicou o passo a passo da correção, que eu apliquei.
- **Revisão:** conferiu o checklist do README, revisou meu teste novo (apontou problemas no nome do arquivo que impediam o pytest de coletá-lo) e revisou o `README-ENTREGA.md`, indicando os trechos que não batiam com o código e as seções que faltavam.
- **Git:** listou o que ainda faltava commitar e enviar ao GitHub.
- **Esta declaração:** redigiu um rascunho a partir do histórico das sessões e do `git log`, que eu revisei.