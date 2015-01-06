require 'axlsx'

module AxlsxDemo
  class ReportWriter
    # attr_accessor :p

    def initialize
      @p = Axlsx::Package.new
    end

    def write
      @p.workbook do |wb|
        # define style
        styles = wb.styles

        title = styles.add_style b: true, bg_color: 'FF0000', fg_color: 'FF', :alignment => { :horizontal=> :center }

        head = styles.add_style :b => true, :bg_color => "00", :fg_color => "FF"
        head_percent = styles.add_style :b => true, :bg_color => "00", :fg_color => "FF", :format_code => '0.00%'

        percent = styles.add_style format_code: '0.00%'

        sub = styles.add_style bg_color: 'D9D9D9'
        sub_percent = styles.add_style bg_color: 'D9D9D9', format_code: '0.00%'

        wb.add_worksheet(name: 'By Date') do |sheet|
          sheet.add_row [ 'Salzburger Land'], style: title
          sheet.add_row [ 'Date', 'Views', 'Clicks', 'CTR'], style: head

          sheet.add_row [ '11/01/2014', '=SUM(B4:B6)', '=SUM(C4:C6)', '=C3/B3'], style: [ nil, nil, nil, percent]
          sheet.add_row [ '', 15399, 65, '=C4/B4'], style: [ sub, sub, sub, sub_percent]
          sheet.add_row [ '', 5000, 10, '=C5/B5'], style: [ sub, sub, sub, sub_percent]
          sheet.add_row [ '', 5256, 24, '=C6/B6'], style: [ sub, sub, sub, sub_percent]

          sheet.add_row [ '10/31/2014', 6243, 36, '=C7/B7'], style: [ nil, nil, nil, percent]
          sheet.add_row [ '10/30/2014', 5603, 34, '=C8/B8'], style: [ nil, nil, nil, percent]
          sheet.add_row [ '10/29/2014', 6282, 26, '=C9/B9'], style: [ nil, nil, nil, percent]

          sheet.add_row [ 'Grant Total', '=SUMIF(A3:A9,"><",B3:B9)', '=SUMIF(A3:A9,"><",C3:C9)', '=C10/B10'], style: [ head, head, head, head_percent]

          sheet.merge_cells 'A1:D1'

          sheet.add_chart(Axlsx::Bar3DChart, :title => 'Views', :start_at => "F1", :end_at => "P20", :bar_dir => :col) do |chart|
            chart.title = sheet["B2"]
            chart.add_series :data => sheet["B3:B9"], :labels => sheet["A3:A9"]#, :colors => ["00FF00", "FF0000", "0600FF"]
            chart.valAxis.gridlines = true
            chart.catAxis.gridlines = false
          end

        end

      end
    end

    def serialize path
      @p.serialize path
    end
  end
end
