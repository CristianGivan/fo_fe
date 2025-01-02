import 'package:excel/excel.dart';
import 'package:fo_fe/core/utils/exports/core_utils_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class ExportToExcel {
  static Future<bool> exportItemsToExcel(
    String sheetName,
    List<List<CellValue?>> tableRows,
  ) async {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel[sheetName];

    _appendRows(sheetObject, tableRows);
    await _saveExcel(excel);
    return true;
  }

  static void _appendRows(Sheet sheetObject, List<List<CellValue?>> tableRows) {
    tableRows.map((row) => sheetObject.appendRow(row)).toList();
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
