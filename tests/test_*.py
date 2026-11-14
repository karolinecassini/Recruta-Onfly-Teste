# CLI - ler todas as linhas do CSV
from helpers import run_cli


def test_reads_more_than_200_rows(tmp_path):
    rows = [{"reservation_id": f"R-{i}"} for i in range(1, 251)]
    report = run_cli(tmp_path, rows)
    assert report["summary"]["total_reservations"] == 250