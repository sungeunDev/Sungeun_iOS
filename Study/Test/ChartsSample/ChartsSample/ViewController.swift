//
//  ViewController.swift
//  ChartsSample
//
//  Created by Ari on 22/11/2018.
//  Copyright © 2018 ssungnni. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var chartView: BarChartView!
    weak var axisFormatDelegate: IAxisValueFormatter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chartView.delegate = self
        axisFormatDelegate = self
        
        setBarChartOptions()
        updateChartData()
        setBarChartAnimations()
    }
    
    func setBarChartOptions() {
        self.chartView.drawGridBackgroundEnabled = false
        self.chartView.chartDescription = nil
        self.chartView.isUserInteractionEnabled = true
        self.chartView.pinchZoomEnabled = false
        self.chartView.dragEnabled = false
        self.chartView.doubleTapToZoomEnabled = false
        
        
        let xAxis = self.chartView.xAxis
        xAxis.drawGridLinesEnabled = false
        xAxis.labelPosition = .bottom
        xAxis.labelTextColor = .blue
        xAxis.centerAxisLabelsEnabled = false
        
        let left = self.chartView.getAxis(.left)
        left.axisMaximum = 100
        left.axisMinimum = 0
        left.drawGridLinesEnabled = false
        left.drawZeroLineEnabled = false
        left.zeroLineWidth = 2
        left.zeroLineColor = .red
        left.labelTextColor = .red
        
        left.spaceTop = 0.35
        
        let right = self.chartView.getAxis(.right)
        right.enabled = false
    }
    
    func updateChartData() {
        let groupCount = 3
        
        let years: [Double] = [2015, 2016, 2017]
        let wordCastDdata: [Double] = [81, 86, 89]
        let otherData: [Double] = [33, 31, 36]
        
        let groupSpace = 0.2
        let barSpace = 0.1
        let barWidth = 0.3
        
        let block: (Double, Double) -> BarChartDataEntry = { year, data in
            return BarChartDataEntry(x: year, y: data)
        }
        
        let yVals1 = zip(years, wordCastDdata).map(block)
        let yVals2 = zip(years, otherData).map(block)
        
        let wordCastDataSet = BarChartDataSet(values: yVals1, label: "워드캐스트")
        wordCastDataSet.setColor(.blue)
        
        let otherDataSet = BarChartDataSet(values: yVals2, label: "otherDataSet")
        otherDataSet.setColor(.red)
        
        let data = BarChartData(dataSets: [wordCastDataSet, otherDataSet])
        data.barWidth = barWidth
        
        let startYear = years[0]
        chartView.xAxis.axisMinimum = startYear
        chartView.xAxis.axisMaximum = startYear + data.groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(groupCount)
        chartView.xAxis.valueFormatter = axisFormatDelegate
        data.groupBars(fromX: startYear, groupSpace: groupSpace, barSpace: barSpace)
        data.setDrawValues(false)
        chartView.data = data
    }
    
    func setBarChartAnimations() {
        chartView.animate(yAxisDuration: 3)
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry.x)
        let percent = String(format: "%.0f", entry.y)
        print("\(percent)%")
    }
}

//MARK: - IAxisValueFormatter
extension ViewController: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        switch value {
        case 2015.5:
            return "2015년"
        case 2016.5:
            return "2016년"
        case 2017.5:
            return "2017년"
        default:
            return ""
        }
    }
}
