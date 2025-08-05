library(tidyverse)
library(ggplot2)
library(RColorBrewer)

ej1 <- read.csv("especialidades_frecuencia.csv")



ggplot(ej1, aes(especialidad, fill=sector)) +
  geom_bar() +
  theme_minimal(base_size = 12) +  # 👈 Estilo limpio y moderno
  scale_fill_brewer(palette = "Set2") +  # 👈 Colores suaves y agradables
  labs(
    title = "Cantidad de profesionales por especialidad",
    subtitle = "Desagregado por sector",
    x = "Especialidad",
    y = "Cantidad",
    fill = "Sector", 
    caption = "Figura 1"
  )+
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold"),
    legend.position = "right"
  ) +
  scale_y_continuous(breaks = 0:10)


ej1<- ej1%>%
  filter(sector == "Adultos")


#display.brewer.pal(n = 4, name = "Set2")

ggplot(ej1, aes(especialidad)) +
  geom_bar(fill= "#66C2A5") +
  theme_minimal(base_size = 12) +  # 👈 Estilo limpio y moderno
  labs(
    title = "Cantidad de profesionales por especialidad",
    subtitle= "Sector Adultos",
    x = "Especialidad",
    y = "Cantidad",
    caption = "Figura 2"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold"),
    legend.position = "right"
  ) +
  scale_y_continuous(breaks = 0:3)  # Ajustá el 10 según el máximo valor que tengas



ej2 <- read.csv("cronograma_ejemplo.csv")
#view(ej2)



ej2_resumen <- ej2 %>%
  group_by(especialidad, dias) %>%
  summarise(profesionales = n(), .groups = "drop")


ej2_resumen$dias <- factor(ej2_resumen$dias, 
                           levels = c("Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"))


ggplot(ej2_resumen, aes(x = dias, y = profesionales, fill = especialidad)) +
  geom_bar(stat = "identity") +
  theme_minimal(base_size = 12) +  # 👈 Estilo limpio y moderno
  scale_fill_brewer(palette = "Paired") +  # 👈 Colores suaves y agradables
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(face = "bold"),
    legend.position = "right"
  ) +
  labs(
    title = "Cantidad de profesionales por día y especialidad",
    x = "Día",
    y = "Cantidad",
    caption = "Figura 3",
    fill = NULL  # 👈 Esto elimina el título de la leyenda
  ) +
  scale_y_continuous(breaks = 0:13)  # Ajustá el 10 según el máximo valor que tengas



