/*  
 * Copyright IBM Corp. 2016
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import java.sql.*;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.IOException;
import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.MissingOptionException;
import org.apache.commons.cli.MissingArgumentException;
import org.apache.commons.cli.ParseException;

class ex4 {

  private static String readFile(String path, Charset encoding) throws IOException 
  {
    byte[] encoded = Files.readAllBytes(Paths.get(path));
    return new String(encoded, encoding);
  }

  private static void help(Options options) {
    // This prints out some help
    HelpFormatter formatter = new HelpFormatter();
    String header = "       Options, flags and arguments may be in any order";
    String footer = "Hands On Lab @ JavaOne 2016\nMySQL Setup, Populate and Query Utility.\nCopyright 2016 IBM. License: Apache 2.0";
    formatter.printHelp("ex4", header, options, footer, true);
    System.exit(0);
  }

  public static void main(String[] params) 
  {
      CommandLine commandLine = null;
      String sqlpath = "", 
             host = "", 
             port = "3306", 
             username = "",
             password = "",
             database = "";
      Boolean query=false;
      Option option_sql = Option.builder("s").argName("sql").hasArg().desc("Path to a file containing a valid MySQL sql statement").build();
      Option option_hostname = Option.builder("h").argName("host").hasArg().desc("ClearDB MySQL Hostname").build();
      Option option_port = Option.builder("n").argName("port").hasArg().desc("ClearDB MySQL Port").build();
      Option option_username = Option.builder("u").argName("username").hasArg().desc("ClearDB MySQL Username").build();
      Option option_password = Option.builder("p").argName("password").hasArg().desc("ClearDB MySQL Password").build();
      Option option_dbname = Option.builder("d").argName("dbname").hasArg().desc("ClearDB MySQL Database Name").build();
      Option option_help = Option.builder("w").argName("wanthelp").hasArg().desc("Help").build();
      Option option_query = Option.builder().longOpt("query").desc("Query type SQL Statement").build();
      Options options = new Options();
      CommandLineParser parser = new DefaultParser();

      options.addOption(option_sql);
      options.addOption(option_hostname);
      options.addOption(option_port);
      options.addOption(option_username);
      options.addOption(option_password);
      options.addOption(option_dbname);
      options.addOption(option_query);
      options.addOption(option_help);

      try {
        commandLine = parser.parse(options, params);
      } catch (MissingOptionException e) {
        help(options);
      } catch (MissingArgumentException e) {
        help(options);
      } catch(ParseException e) { 
        System.out.println(e);
      }

      if (commandLine.hasOption("w") || params.length == 0)
      {
          help(options);
      }

      if (commandLine.hasOption("s"))
      {
          sqlpath = commandLine.getOptionValue("s");
      } else {
          System.out.println("Missing path to a SQL statement file");
          help(options);
      }
      if (commandLine.hasOption("h"))
      {
          host = commandLine.getOptionValue("h");
      } else {
          System.out.println("Missing ClearDB hostname (e.g. us-cdbr-iron-east-??.cleardb.net)");
          help(options);
      }
      if (commandLine.hasOption("n"))
      {
          port = commandLine.getOptionValue("n");
      } else {
          System.out.println("Missing ClearDB Port Value.  Defaulting to 3306");
      }
      if (commandLine.hasOption("u"))
      {
          username = commandLine.getOptionValue("u");
      } else {
          System.out.println("Missing ClearDB Username");
          help(options);
      }
      if (commandLine.hasOption("p"))
      {
          password = commandLine.getOptionValue("p");
      } else {
          System.out.println("Missing ClearDB Password");
          help(options);
      }
      if (commandLine.hasOption("d"))
      {
          database = commandLine.getOptionValue("d");
      } else {
          System.out.println("Missing ClearDB Database Name");
          help(options);
      }

      if (commandLine.hasOption("query"))
      {
          query=true;
      }

      String connectionURL = new StringBuilder()
                          .append("jdbc:mysql://")
                          .append(host)
                          .append(":")
                          .append(port)
                          .append("/")
                          .append(database)
                          .append("?reconnect=true")
                          .toString();

      try {
        Class.forName("com.mysql.jdbc.Driver");
      } catch(ClassNotFoundException e) { 
        System.out.println(e);
      }

    try { 
      Connection con = DriverManager.getConnection(connectionURL,username,password);
      Statement stmt=con.createStatement();
      if (query) {
        System.out.println("Querying target MySQL DB ...");
        ResultSet rs=stmt.executeQuery(readFile(sqlpath, Charset.defaultCharset()));
        while(rs.next())
          System.out.println(rs.getInt("emp_no") + "  " + rs.getDate("birth_date") + "  " + rs.getString("first_name") + "  " + rs.getString("last_name") + "  " + rs.getString("gender") + "  " + rs.getDate("hire_date"));
      } else {
        System.out.println("Updating target MySQL DB ...");
        int result = stmt.executeUpdate(readFile(sqlpath, Charset.defaultCharset()));
        System.out.println(result);
      }
      con.close();
    } catch (Exception e) {
      System.out.println(e);
    }
  }
}
