//
//  Grid.swift
//  lecture1
//
//  Created by mac on 2021/1/29.
//  Copyright © 2021 Weilai Wang. All rights reserved.
//

import SwiftUI

struct Grid<Item,ItemView>: View where Item:Identifiable,ItemView:View{
    var items:[Item]
    var viewForItem:(Item) ->ItemView
    	
    
    init(_ items:[Item],viewForItem:@escaping (Item) -> ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View{
        GeometryReader{ geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
            
        }
    }
    
    func body(for layout:GridLayout) ->some View{
        ForEach(items){item in
            
            self.body(for:item, in: layout)
          
        }
    }
    
    func body(for item:Item, in layout: GridLayout) -> some View{
        let index = items.firstIndex(matching: item)!
                return self.viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index))
            
        }
    
    }



