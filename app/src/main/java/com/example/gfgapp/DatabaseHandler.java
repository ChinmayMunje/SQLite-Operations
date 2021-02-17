package com.example.gfgapp;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;

public class DatabaseHandler extends SQLiteOpenHelper {

    private static final String DB_NAME = "demodb";
    private static final int DB_VERSION = 1;
    private static final String TABLE_NAME = "record";
    private static final String ID_COL = "id";
    private static final String NAME_COL = "course";
    private static final String DURATION_COL = "duration";
    private static final String TRACKS_COL = "tracks";

    public DatabaseHandler(Context context) {
        super(context, DB_NAME, null, DB_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {

        String query = "CREATE TABLE " + TABLE_NAME + " ("
                + ID_COL + " INTEGER PRIMARY KEY AUTOINCREMENT, "
                + NAME_COL + " TEXT,"
                + DURATION_COL + " TEXT,"
                + TRACKS_COL + " TEXT)";

        db.execSQL(query);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
        onCreate(db);
    }

    public void insertRecord(String name, String duration, String tracks) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(NAME_COL, name);
        values.put(DURATION_COL, duration);
        values.put(TRACKS_COL, tracks);
        db.insert(TABLE_NAME, null, values);
        db.close();
    }

//    public ArrayList<String> getRecords() {
//        String query = "SELECT * FROM " + TABLE_NAME;
//        ArrayList<String> recordsArrayList = new ArrayList<>();
//        String result = "";
//        SQLiteDatabase db = this.getReadableDatabase();
//        Cursor cursor = db.rawQuery(query, null);
//        cursor.moveToFirst();
//
//        for (int i = 0; i < cursor.getCount(); i++) {
//            recordsArrayList.add(cursor.getString(i));
//        }
//        db.close();
//        return recordsArrayList;
//    }

//    public ArrayList<CourseModal> getAllCourses() {
//
//        SQLiteDatabase db = this.getWritableDatabase();
//
//        ArrayList<CourseModal> courseModals = new ArrayList<>();
//
//        String query = "SELECT  * FROM " + TABLE_NAME + " ORDER BY " + ID_COL +" DESC";
//
//        Cursor cursor = db.rawQuery(query, null);
//
//        if (cursor.moveToFirst()) {
//            do {
//                CourseModal courseModal = new CourseModal();
//                courseModal.setId((Integer.parseInt(cursor.getString(0))));
//               courseModal.setCourseName(cursor.getString(1));
//               courseModal.setCourseDuration(cursor.getString(2));
//               courseModal.setCourseTracks(cursor.getString(3));
//
//            } while (cursor.moveToNext());
//        }
//        return courseModals;
//    }

    public void updateCourse(String id, String courseName,String courseTracks,String courseDuration) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(NAME_COL, courseName);
        values.put(DURATION_COL,courseDuration);
        values.put(TRACKS_COL,courseTracks);
        db.update(TABLE_NAME, values, "id=?", new String[]{id});
        db.close();
    }

    public void deleteRecord(String id) {
        SQLiteDatabase db = this.getWritableDatabase();
        db.delete(TABLE_NAME, "id=?", new String[]{id});
        db.close();
    }

}
