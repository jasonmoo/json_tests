import java.io.StringWriter;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.json.simple.parser.*;
import org.json.simple.*;

class JSONTest {

    public static void main(String args[]) {

        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

            String input;
            JSONParser parser = NULL;

            try {
                parser = new JSONParser();
            } catch (Exception e) {
                System.out.println(e);
            }


            while ((input = br.readLine()) != null) {
                Object obj = parser.parse(input);
                JSONObject jobj = (JSONObject) obj;
                StringWriter out = new StringWriter();
                jobj.writeJSONString(out);
                String jsonText = out.toString();
                System.out.print(jsonText);
            }

        } catch (IOException io) {
            io.printStackTrace();
        }
    }
}