package cranberry.util;

/** **/
enum Maybe<T>
{
	NOTHING;
	JUST(val :T);
}