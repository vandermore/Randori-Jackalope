package net.digitalprimates.translators.actionscript;

import java.io.*;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: dmoore
 * Date: 7/18/13
 * Time: 4:14 PM
 * To change this template use File | Settings | File Templates.
 */
public class ExportPreparation {
    //TODO:: This class and the base directory could be made more generic for more languages, i.e. made into a utility class.
    public static final String BASE_DIRECTORY = "outputHeaders/actionScript";
    public static final String TAB = "\t";
    public static final String LINE_BREAK = "\n";

    protected FileOutput fileOutput;

    //Set up for writing output to a file.
    protected String fileForWritingName;
    public String packageStructure;

    //NOTE:: Do this thing better than just pre and post importStatements
    protected String beforeImportStatements = "";
    protected ArrayList<String> importStatements = new ArrayList<String>();
    protected String afterImportStatements = "";

    public void beginOutputFile( String fileName ) {
        fileForWritingName = fileName;
    }

    public void addToPreImport( String value ) {
        beforeImportStatements += value;
    }

    public void addImports( String value ) {
        //Check to see if the import was already added.
        if ( !( importStatements.contains( value ) ) ) {
            //It's not, add it.
            importStatements.add( value );
        }
    }

    public void addToPostImport( String value ) {
        afterImportStatements += value;
    }

    protected String coalateImportStatements() {
        String statements = "";
        for ( String value : importStatements ) {
            statements += TAB;
            statements += "import ";
            statements += value;
            statements += ";";
            statements += LINE_BREAK;
        }

        return statements;
    }

    public void finishOutputFile() {
        fileOutput.openFileForWriting( fileForWritingName );
        fileOutput.writeToFile(beforeImportStatements);
        fileOutput.writeToFile( LINE_BREAK );
        fileOutput.writeToFile( coalateImportStatements() );
        fileOutput.writeToFile( LINE_BREAK );
        fileOutput.writeToFile( afterImportStatements );
        fileOutput.closeFileForWriting();
        cleanup();
    }

    protected void cleanup() {
        beforeImportStatements = "";
        importStatements = new ArrayList<String>();
        afterImportStatements = "";
    }

    /**
     * Creates a directory structure from a . delimited string.
     * @param value
     */
    public void createDirectories( String value ) {
        packageStructure = value;
        fileOutput = new FileOutput();
        fileOutput.createDirectories( value, BASE_DIRECTORY );
    }
}
