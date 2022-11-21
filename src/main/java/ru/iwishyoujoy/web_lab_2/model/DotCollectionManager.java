package ru.iwishyoujoy.web_lab_2.model;

import java.util.LinkedList;

public class DotCollectionManager {
    private static LinkedList<Dot> collection = new LinkedList<>();

    public static void add(Dot dot){
        collection.add(dot);
    }
    public static void clear(){
        collection = new LinkedList<>();
    }
    public static LinkedList<Dot> getCollection(){
        return collection;
    }

}