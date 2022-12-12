# Integración contínua

@EugenioTesio

El proceso de integración contínua también conocido por las sigas __CI/CD (continuos integration / continuos development)__ es un mecanismo utilizado para ejecutar trabajos automáticos en relación a la porción de código que se está subiendo a nuestro repositorio de códido a través de un git push. Estos trabajos van desde auditorías del código (formato, identación, máxima cantidad de caracteres por línea, etc), ejecución de test y/o ejecución de acciones (enviar un mail, un mensaje de Slack, ejecutar un request a una API, etc).

La secuencia de trabajos, __pipeline__, varia mucho de acuerdo al leguaje de programación y al ambiente al cual se pushea el código. No es lo mismo subir un código al repositorio de desarrollo que hacerlo al de producción, este úlimo necesita mucho más controles e inclusive tener automatizado el despligue del mismo a los servidores de producción o la generación de compilado de la aplicación para poder subir a las tiendas (Google Play, App Store, Microsoft Apps) donde será publicado.

Actualmente existen muchas opciones para integración contínua, inclusive cada leguaje de programación tiene sus favoritas. Dentro de las más conocidas encontramos a [Jenkins](https://www.jenkins.io/), [Bamboo](https://www.atlassian.com/software/bamboo) de Atlassian, [TeamCity](https://www.jetbrains.com/teamcity/) de Jetbrains, etc. También podemos encontrar herramientas de integración dentro de cada nube; [Amazon Pipeline](https://aws.amazon.com/es/codepipeline/), [Google Build](https://cloud.google.com/build), [Azure Pipelines](https://azure.microsoft.com/es-es/products/devops/pipelines/) etc.

Podríamos decir que casi la mayoría de compañías que ofrece un reposiotorio de código ofrece también un herramienta de integración continua. Lamentablemente, no hay un lenguaje standard para la creación de estos trabajos, por lo cual cada solución tiene su propio leguaje de programación y es por esto que el desarrolador debe elegir la mejor solución que se adapte a su necesidad y focalizarse en ella.

En el caso de Flutter y de este curso, el cual tiene su repositorio en GitHub, consideramos que la mejor opción de integración es [GitHub Actions](https://docs.github.com/en/actions), una herramienta muy reciente (Octubre 2018) con respecto a la antiguedad y madurez de su repositorio, pero con un potencial tremendo.

Esperamos les guste mucho como a nosotros hacer esta sección! 🥳
