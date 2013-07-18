package net.digitalprimates.translators.actionscript;

import java.io.*;
import java.util.ArrayList;

/**
 * User: David "Vandermore" Moore
 * Date: 7/11/13
 * Time: 12:04 PM
 */
public class FileOutput {
    //Set up for writing output to a file.
    protected Writer writer = null;
    private String directoryPath = "";
    private String baseDirectory = "";

    protected void openFileForWriting( String fileName ) {
        try {
            writer = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream( baseDirectory + directoryPath + "\\" + fileName ), "utf-8"));
        } catch (IOException ex){
            // report
            System.out.println( "Unable to open file for writing: " + ex.toString() );
        }
    }

    protected void writeToFile( String stuffToWrite ) {
        try {
            writer.write( stuffToWrite );
        } catch (IOException ex){
            // report
            System.out.println( "Unable to write to file: " + ex.toString() );
        }
    }

    public void closeFileForWriting() {
        try {
            writer.close();
        } catch (Exception ex) {
            // report
            System.out.println( "Unable to close file for writing: " + ex.toString() );
        }
    }

    /**
     * Creates a directory structure from a . delimited string.
     * @param value
     */
    public void createDirectories( String value, String baseDirectory ) {
        String packageStructure = value;
        this.baseDirectory = baseDirectory;

        String[] packagePathArr = getPackagePath( value );
        String dirSeparator = "\\";

        //Need to loop through the package path array to create the directory and subdirectories.
        for ( int i = 0; i < packagePathArr.length; i++ ) {
            directoryPath += dirSeparator;
            directoryPath += packagePathArr[ i ];
        }

        File directoryStructure = new File( baseDirectory + directoryPath );
        try {
            if ( directoryStructure.mkdirs() ) {
                //System.out.println("Directory Created");
            } else {
                //System.out.println("Directory is not created");
            }
        } catch(Exception e){
            e.printStackTrace();
        }
    }

    /**
     * Gets an array of strings that is the package package path from a dot delimited string.
     * @param value
     * @return
     */
    protected String[] getPackagePath ( String value ) {
        //The split value is a regex. So I need to escape the . character.
        return value.split("\\.");
    }
}
