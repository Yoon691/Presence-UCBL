**Projet m1if03-2020-groupe 58**


Projets réalisés par :

    - Aliou Sadio BARRY p1809163
    - Younes DERBAL p1809208



***Section TP2***

1.  Travail sur l'application

    1.1 servlet
    Pour la servlet "Deco" nous avons utilisé une redirection "externe" : response.sendRedirection("index.html").

    1.2 jsp
    la méthode HTTP attendu pour requêter user.jsp est "GET" et nous avons faire "http://localhost:8080/m1if03_gr58_war/user.jsp?login=name" où name   était le nom de l'utilisateur.

    1.3 Structuration et création d'un menu

    1.4 Amélioration de l'interface

    1.5 Amélioration des fonctionnalités

 2. Déploiement sur votre VM

    - Manipulations préliminaires

    - Installation

    - Configuration

    - Intégration / Déploiement continus 

    - URLs de notre projet :
        - http://192.168.75.116:8080/v1/
        - https://192.168.75.116/api/v1/

***Section TP3***

- Déploiement
    -  http://192.168.75.116:8080/v2/
    -  https://192.168.75.116/api/v2/ 

***Section TP7***

- Déploiement sur Tomcat
    - le temps de chargement de la page HTML initiale : 239
    - le temps d'affichage de l'app shell : 1140
    - le temps d'affichage du chemin critique de rendu (CRP) : 1143.

- Déploiement sur nginx
    - le temps de chargement de la page HTML initiale : 226
    - le temps d'affichage de l'app shell : 620
    - le temps d'affichage du chemin critique de rendu (CRP) : 620.

- Amélioration 
    - le temps de chargement de la page HTML initiale : 5,44%
    - le temps d'affichage de l'app shell : 45,61%
    - le temps d'affichage du chemin critique de rendu (CRP) : 45,75%   

***Partie 3 Optimisation de votre application****
Selon les  1er résultats de Lighthouse , nous étions à 83% pour l'accessibilité à cause de "Form element do not have associated label", après corrections nous avons les résultats suivants

- Déploiement sur Tomcat
    - le temps de chargement de la page HTML initiale : 86,66
    - le temps d'affichage de l'app shell : 270,66
    - le temps d'affichage du chemin critique de rendu (CRP) : 270,66.

- Déploiement sur nginx
    - le temps de chargement de la page HTML initiale : 70,94
    - le temps d'affichage de l'app shell : 238,94
    - le temps d'affichage du chemin critique de rendu (CRP) : 238,94

- Amélioration 
    - le temps de chargement de la page HTML initiale : 18,13%
    - le temps d'affichage de l'app shell : 11,71%
    - le temps d'affichage du chemin critique de rendu (CRP) : 11,71%  

Selon un 2ème résultat de Lighthouse , nous étions à 78% pour le SEO à cause de "Does not have a <meta name="viewport"> tag with width or initial-scaleNo `<meta name="viewport">` tag found" et "Document does not have a meta description", après nous avons les résultats suivants

- Déploiement sur Tomcat
    - le temps de chargement de la page HTML initiale : 60,32
    - le temps d'affichage de l'app shell : 210,20
    - le temps d'affichage du chemin critique de rendu (CRP) : 210,25.

- Déploiement sur nginx
    - le temps de chargement de la page HTML initiale : 42,29
    - le temps d'affichage de l'app shell : 180,75
    - le temps d'affichage du chemin critique de rendu (CRP) : 180,75

- Amélioration 
    - le temps de chargement de la page HTML initiale : 29,89%
    - le temps d'affichage de l'app shell : 14,01%
    - le temps d'affichage du chemin critique de rendu (CRP) : 14,03%   
        