import java.io.*;
import java.util.ArrayList;
import java.util.regex.Pattern;

public class PrepareMapReduceToWordCloud {
    private static String fileInputPath = "/Users/xtrs84zk/Desktop/mapreduce";

    public static void main(String[] args) {
        ArrayList<String> codigoPorLineas;
        ArrayList<String> analisisMapreduceDeTodasLasLineas;
        String rutaDondeSeGuardaElArchivo = "/Users/xtrs84zk/Documents/test/temp/mapreduceUsableByWordCloud.txt";
        try {
            codigoPorLineas = cargarCodigoDesdeUnArchivoDeTexto();
        } catch (IOException e) {
            System.err.println(e.getMessage());
            System.out.println("No se pudo detectar el mapreduce.");
            return;
        }
        System.out.println("Mapreduce cargado correctamente.");

        //Analizar línea por línea
        analisisMapreduceDeTodasLasLineas = new ArrayList();
        int i = 0;
        try {
            do {
                analisisMapreduceDeTodasLasLineas.addAll(detectarInstanciasYEscribirEsaCantidadDeVeces(codigoPorLineas.get(i)));
                i++;
            } while (codigoPorLineas.get(i) != null);
        } catch (Exception e) {
            //Se espera que esta excepción siempre ocurra.
            System.err.print("");
        }
        System.out.println("Se ha completado el ajuste en el archivo mapreduce.");
        //concatenar el análisis a un archivo
        try {
            escribirElResultadoAUnArchivo(analisisMapreduceDeTodasLasLineas, rutaDondeSeGuardaElArchivo);
            System.out.println("Mapreduce compatible con WordCloud exportado correctamente.");
        } catch (Exception e) {
            System.err.print(e.toString());
            System.out.println("El archivo no se pudo guardar, imprimiendo el resultado en pantalla.");
            try {
                i = 0;
                do {
                    System.out.print(analisisMapreduceDeTodasLasLineas.get(i));
                    i++;
                } while (analisisMapreduceDeTodasLasLineas.get(i) != null);
            } catch (Exception p) {
                System.err.print("Límite de la lista alcanzado, es común. \n");
            }
        }
    }

    /**
     * 
     * @return
     * @throws IOException
     */
    private static ArrayList detectarInstanciasYEscribirEsaCantidadDeVeces(String lineaEnLaCualDetectar) {
        ArrayList<String> lineaARegresar = new ArrayList<>();
        if (!lineaEnLaCualDetectar.contains("\uFEFF")) {
            String temp[];
            int cuantasVecesApareceLaPalabra;
            temp = lineaEnLaCualDetectar.split("	");
            // Si ocurre algún error al intentar romper la expresión, se imprime igual
            if (temp.length > 2) {
                lineaARegresar.add(lineaEnLaCualDetectar);
                return lineaARegresar;
            }
            cuantasVecesApareceLaPalabra = Integer.parseInt(temp[1]);
            if (cuantasVecesApareceLaPalabra > 0) {
                for (int i = 0; i < cuantasVecesApareceLaPalabra; i++) {
                    lineaARegresar.add(temp[0] + " ");
                }
            }
        }
        lineaARegresar.add("\r\n");
        return lineaARegresar;
    }

    /**
     * Se encarga de leer un archivo previamente especifícado en codificación UTF-8
     *
     * @return ArrayList con el contenido del archivo
     * @throws IOException en caso de no poder acceder o leer el mismo.
     */
    private static ArrayList cargarCodigoDesdeUnArchivoDeTexto() throws IOException {
        ArrayList<String> codigoPorLineas;
        File archivoDelCodigo = new File(fileInputPath);
        InputStreamReader input;
        input = new InputStreamReader(new FileInputStream(archivoDelCodigo), "UTF8");
        codigoPorLineas = new ArrayList<>();
        String r;
        BufferedReader in = new BufferedReader(input);
        // el código será leído en minúsculas
        while ((r = in.readLine()) != null) {
            codigoPorLineas.add(r.toLowerCase());
        }
        in.close();
        return codigoPorLineas;
    }

   
    /**
     * Recibe como parámetro un ArrayList y lo escribe a un archivo.
     *
     * @param analisisLexico que contiene la información a escribir.
     * @throws IOException en caso de no poder escribir al archivo.
     */
    private static void escribirElResultadoAUnArchivo(ArrayList<String> analisisLexico,
            String rutaDondeSeGuardaElArchivo) throws IOException {
        FileWriter writer = new FileWriter(rutaDondeSeGuardaElArchivo);
        for (String anAnalisisLexico : analisisLexico) {
            if (anAnalisisLexico != null) {
                writer.write(anAnalisisLexico);
            }
        }
        writer.close();
    }
}