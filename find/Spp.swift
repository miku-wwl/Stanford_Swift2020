//
//  spp.swift
//  spp
//
//  Created by mac on stopNumber21/2/2.
//

import Foundation

class Spp{
    let stopNumber = 6
    var source:Int
    var destination:Int
    
    var map = [[Int]](repeating: [Int](repeating: 0, count: 6),count:6)
    var cityName = [String] (repeating: " ", count: 6)
    var visit = [Int] (repeating:0 ,count: 6)
    var precursor = [Int] (repeating:0, count:6)
    //var check = [Int] (repeating:0,count:stopNumber)
    
    
    func dj() -> Int{
        var current = source
       
        var dis = [Int] (repeating: 999999, count:stopNumber)
        
        dis[current] = 0
        visit[current] = 1
        precursor[current] = -1
        while (visit.contains(0)){
            for i in 0..<stopNumber{
                if (map[current][i] + dis[current])<dis[i] && map[current][i] != 0{
                    dis[i] = map[current][i] + dis[current]
                    precursor[i] = current
                    }
            }
            
            var temp:Int = 999999
            var next:Int = 0
            for i in 0..<stopNumber{
                if visit[i] == 0 && dis[i] < temp{
                    temp = dis[i]
                    next = i
                }
            }
            visit[next] = 1
            current = next
        }
        
        return dis[destination]
        
    }
       
    func shortway() -> String{
        var s:String = ""
        var index:Int = destination
        s = s + cityName[index]
        index = precursor[index]
        
        while index != -1{
            s = s + "->" + cityName[index]
            index = precursor [index]
        }
        return s
    }
    
    init(source:Int,destination:Int){
        self.source = destination
        self.destination = source
        
        map[0][1] = 2; map[1][0] = 2
        map[0][2] = 1; map[2][0] = 1
        map[0][3] = 1; map[3][0] = 1
        map[1][5] = 4; map[5][1] = 4
        map[2][4] = 2; map[4][2] = 2
        map[4][5] = 6; map[4][5] = 6
        cityName[0] = "A"
        cityName[1] = "B"
        cityName[2] = "C"
        cityName[3] = "D"
        cityName[4] = "E"
        cityName[5] = "F"
    }
    
    
    
    
}

print("Hello, World!")
var spp = Spp(source: 2, destination: 5)
print(spp.dj())
print(spp.shortway())
