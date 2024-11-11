CC = gcc
CFLAGS = -Wall -g -I.
OBJ = persona.o institucion.o reporte.o main.o
HEADERS = miLibPersona.h miLibInstitucion.h miReporte.h
EXEC = programa

# Regla principal para generar el ejecutable
$(EXEC): $(OBJ)
	$(CC) $(OBJ) -o $(EXEC)

# Regla de patrón para generar archivos objeto
%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

# Reglas individuales para archivos objeto (opcional si no quieres usar regla de patrón)
persona.o: persona.c miLibPersona.h miLibInstitucion.h
	$(CC) $(CFLAGS) -c persona.c -o persona.o

institucion.o: institucion.c miLibPersona.h miLibInstitucion.h
	$(CC) $(CFLAGS) -c institucion.c -o institucion.o

reporte.o: reporte.c miLibPersona.h miLibInstitucion.h miReporte.h
	$(CC) $(CFLAGS) -c reporte.c -o reporte.o

main.o: main.c miLibPersona.h miLibInstitucion.h miReporte.h
	$(CC) $(CFLAGS) -c main.c -o main.o

# Regla de limpieza de archivos
.PHONY: clean
clean:
	rm -f $(OBJ) $(EXEC)
