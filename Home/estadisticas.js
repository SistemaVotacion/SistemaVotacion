// Archivo: estadisticas.js

document.addEventListener("DOMContentLoaded", () => {
    const totalVotosElement = document.getElementById("total-votos");

    // Simulación de una API para obtener datos de votos totales
    const obtenerTotalVotos = async () => {
        // Simulamos un retraso de red
        return new Promise((resolve) => {
            setTimeout(() => {
                resolve({ votantes: 50, total: 100 }); // Ejemplo: 50 de 100 personas han votado
            }, 1000); // 1 segundo de retraso simulado
        });
    };

    // Función para actualizar el total de votos en el DOM
    const actualizarTotalVotos = async () => {
        try {
            // Llamada al API
            const datos = await obtenerTotalVotos();
            const { votantes, total } = datos;

            // Actualizar el contenido del elemento
            totalVotosElement.textContent = `${votantes}/${total}`;
        } catch (error) {
            console.error("Error al obtener los votos:", error);
            totalVotosElement.textContent = "Error al cargar los votos";
        }
    };

    // Llamar la función al cargar la página
    actualizarTotalVotos();
});
