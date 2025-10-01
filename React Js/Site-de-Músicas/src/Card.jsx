export default function Card(props, onClick){
    return(
        <>
        <div className='card' onClick={onClick}>
            <div className="card-image">
                <img src={props.img} alt={props.altImg} />
            </div>
            <p className="card-title">{props.titulo}</p>
            <p className="card-body">
                {props.descricao}
            </p>
            <p className="card-buttons">
                <p className="card-time">{props.tempo}</p>
                <button className="card-play" >▶</button>
            </p>
        </div>
        </>
    )
}