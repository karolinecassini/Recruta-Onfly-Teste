# Onfly — Consolidador de reservas de hotel

Rodei `pytest -q`, conforme solicitado. Como os testes falhavam, usei cada um para localizar a regra quebrada. 

### 1 - Conversão de câmbio invertida
src/onfly_report/services/currency_converter.py
O valor era dividido pela taxa rate_to_brl, mas a taxa diz quantos BRL vale 1 unidade da moeda, então a conta certa é multiplicar.
return amount * rate

### 2 - Noites calculadas pelo dia do mês
src/onfly_report/services/stay_calculator.py
O código subtraía o dia do mês (checkout.day - checkin.day). Na virada de mês o resultado estava negativo
return (checkout - checkin).days * rooms

### 3 - NO_SHOW entrando nos totais financeiros
src/onfly_report/services/status_policy.py
A regra excluía CANCELLED (status != "CANCELLED"), então NO_SHOW era contado como faturável, quando só CONFIRMED deveria contar.
return status == "CONFIRMED"

### 4 - Ranking de hotéis em ordem crescente
src/onfly_report/services/report_builder.py
O sorted ordenava por valor em ordem crescente. 
sorted(hotels.items(), key=lambda item: (-item[1]["amount"], item[0]))
Assim, foi realizada ordenaçao do maior para o menor valor e, em caso de empate, desempata pelo hotel_id de forma estável.

### 5 - Leitura finalizada em 200 linhas
src/onfly_report/repositories/csv_reservation_repository.py
"if len(rows) == 200: break" interrompia a leitura. Como o o data/reservas_hoteis.csv possui 300 reservas,100 ficavam fora do relatório.
As linhas do limite foram removidas. 
for values in reader:
rows.append(RawRow(line_number=reader.line_num, values=values))
return rows