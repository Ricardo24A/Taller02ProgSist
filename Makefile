# Variables
CC = gcc
CFLAGS = -Wall
OBJ = persona.o institucion.o reporte.o main.o
DEPS = miLibPersona.h miLibInstitucion.h miReporte.h

programa: $(OBJ)
	$(CC) $(CFLAGS) -o programa $(OBJ)

# Regla para compilar y agregar depencias si no las hay al main.c
main.o: main.c $(DEPS)
	$(CC) $(CFLAGS) -c main.c

# Regla para compilar y agregar depencias si no las hay a persona.c
persona.o: persona.c miLibPersona.h miLibInstitucion.h
	$(CC) $(CFLAGS) -c persona.c

# Regla para compilar y agregar depencias si no las hay a institucion.c
institucion.o: institucion.c miLibPersona.h miLibInstitucion.h
	$(CC) $(CFLAGS) -c institucion.c

# Regla para compilar y agregar depencias si no las hay a reporte.c
reporte.o: reporte.c $(DEPS)
	$(CC) $(CFLAGS) -c reporte.c

.PHONY: clean
clean:
	rm -f *.o programa
