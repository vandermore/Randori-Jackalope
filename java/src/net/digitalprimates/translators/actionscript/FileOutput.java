package net.digitalprimates.translators.actionscript;

import java.io.*;

/**
 * User: David "Vandermore" Moore
 * Date: 7/11/13
 * Time: 12:04 PM
 */
public class FileOutput {
    //TODO:: This class and the base directory could be made more generic for more languages, i.e. made into a utility class.
    public static final String BASE_DIRECTORY = "outputHeaders/actionScript";

    //Set up for writing output to a file.
    protected Writer writer = null;
    protected String fileForWritingName;
    public String packagePath;

    public void openFileForWriting( String fileName ) {
        fileForWritingName = fileName;

        try {
            writer = new BufferedWriter(new OutputStreamWriter(
                    new FileOutputStream( BASE_DIRECTORY + "\\" + fileName ), "utf-8"));
        } catch (IOException ex){
            // report
            System.out.println( "Unable to open file for writing: " + ex.toString() );
        }
    }

    public void writeToFile( String stuffToWrite ) {
        //TODO: I don't like this here.
        if ( writer == null ) {
            openFileForWriting( packagePath + ".as" );
        }

        try {
            writer.write( stuffToWrite );
        } catch (IOException ex){
            // report
            System.out.println( "Unable to write to file: " + ex.toString() );
        }
    }

    public void insertLineBreak() {
        //TODO: I don't like this here.
        if ( writer == null ) {
            openFileForWriting( packagePath + ".as" );
        }

        try {
            writer.write( "\n" );
        } catch (IOException ex){
            // report
            System.out.println( "Unable to write linebreak to file: " + ex.toString() );
        }
    }

    public void closeFileForWriting() {
        if ( writer == null ) {
            return;
        }

        try {
            writer.close();
        } catch (Exception ex) {
            // report
            System.out.println( "Unable to close file for writing: " + ex.toString() );
        }
    }
}
