import 'package:excel/excel.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ExportToExcel {
  static Future<void> exportItemsToExcel(
    String sheetName,
    List<CellValue?> tableHeader,
    List<List<CellValue?>> tableRows,
  ) async {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel[sheetName];

    _appendHeader(sheetObject, tableHeader);
    _appendRows(sheetObject, tableRows);
    await _saveExcel(excel);
  }

  static void _appendHeader(Sheet sheetObject, List<CellValue?> tableHeader) {
    sheetObject.appendRow(tableHeader);
  }

  static void _appendRows(Sheet sheetObject, List<List<CellValue?>> tableRows) {
    tableRows.map((row) => sheetObject.appendRow(row));
  }

  static Future<void> _saveExcel(Excel excel) async {
    final excelExportPath = await getExcelExportPath();

    final fileBytes = excel.encode();
    if (fileBytes != null) {
      File(excelExportPath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);
    } else {
      throw Exception('Failed to encode Excel file');
    }
  }
}
