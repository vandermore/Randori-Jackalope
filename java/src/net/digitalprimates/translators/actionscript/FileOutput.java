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
        }
    }

    public void writeToFile( String stuffToWrite ) {
        try {
            writer.write( stuffToWrite );
        } catch (IOException ex){
            // report
        }
    }

    public void insertLineBreak() {
        try {
            writer.write( "\n" );
        } catch (IOException ex){
            // report
        }
    }

    public void closeFileForWriting() {
        try {
            writer.close();
        } catch (Exception ex) {
            // report
        }
    }
}
