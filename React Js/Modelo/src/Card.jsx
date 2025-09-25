export default function Card(props){ // o export default identifica a função padrão
    return ( 
        // Por que do abre e fecha chaves? pq vai colocar em html o código

        // ou div
        <> 
        <div class="card">
        <img src={props.img} alt="floresta" />
        <div class="card__content">
            <p class="card__title">{props.titulo}</p>
            {
                // adicionar lógica no html
                
            }
            <p class="card__description">{props.descricao}</p>
        </div>
        </div>
        </>
    )
}

function CardOutro(){
    return(
        <div>

        </div>
    )
}