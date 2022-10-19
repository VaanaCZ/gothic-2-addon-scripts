// ***********************************
// C_WantToEat
// -----------
// ACHTUNG: Fressen heißt nicht Jagen!
// Jagen geht über C_PredatorFoundPrey
// ***********************************

func int C_WantToEat (var C_NPC slf, var C_NPC oth)
{
	// ------ ich bin ein Party-Monster ------
	if (slf.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return FALSE;
	};
	
	// ------ Scavenger / OrcBiter frisst... ------
	if (slf.guild == GIL_SCAVENGER)
	{
		// ------ Menschen und Orks ------
		if (oth.guild < GIL_SEPERATOR_HUM)		{	return TRUE;	};
		if (oth.guild > GIL_SEPERATOR_ORC)		{	return TRUE;	};
		// ------ klassische Beutetiere ------
		if (oth.guild == GIL_SHEEP)				{	return TRUE;	};
		if (oth.guild == GIL_GIANT_RAT)			{	return TRUE;	};
		if (oth.guild == GIL_MOLERAT) 			{	return TRUE;	};
		// ------ Geflügel ------
//		if (oth.guild == GIL_SCAVENGER)			{	return TRUE;	};
		if (oth.guild == GIL_HARPY)				{	return TRUE;	};
		// ------ Wild ------
		if (oth.guild == GIL_WOLF)				{	return TRUE;	};
		if (oth.guild == GIL_SUMMONED_WOLF)		{	return TRUE;	};
		if (oth.guild == GIL_SHADOWBEAST)		{	return TRUE;	};
		// ------ Reptilien ------
		if (oth.guild == GIL_GOBBO)				{	return TRUE;	};
		if (oth.guild == GIL_WARAN)				{	return TRUE;	};
		if (oth.guild == GIL_LURKER)			{	return TRUE;	};
		if (oth.guild == GIL_SNAPPER)			{	return TRUE;	};
		// ------ Insekten ------
		if (oth.guild == GIL_MEATBUG)			{	return TRUE;	};
		if (oth.guild == GIL_GIANT_BUG)			{	return TRUE;	};
		if (oth.guild == GIL_BLOODFLY)			{	return TRUE;	};
		if (oth.guild == GIL_MINECRAWLER)		{	return TRUE;	};
	};
	
	// ------ Riesenratte frisst... ------
	if (slf.guild == GIL_GIANT_RAT)
	{
		// ------ Menschen und Orks ------
		if (oth.guild < GIL_SEPERATOR_HUM)		{	return TRUE;	};
		if (oth.guild > GIL_SEPERATOR_ORC)		{	return TRUE;	};
		// ------ klassische Beutetiere ------
		if (oth.guild == GIL_SHEEP)				{	return TRUE;	};
		if (oth.guild == GIL_GIANT_RAT)			{	return TRUE;	};	//auch Artgenossen
		if (oth.guild == GIL_MOLERAT) 			{	return TRUE;	};
		// ------ Geflügel ------
		if (oth.guild == GIL_SCAVENGER)			{	return TRUE;	};
		if (oth.guild == GIL_HARPY)				{	return TRUE;	};
		// ------ Wild ------
		if (oth.guild == GIL_WOLF)				{	return TRUE;	};
		if (oth.guild == GIL_SUMMONED_WOLF)		{	return TRUE;	};
		if (oth.guild == GIL_SHADOWBEAST)		{	return TRUE;	};
		// ------ Reptilien ------
		if (oth.guild == GIL_GOBBO)				{	return TRUE;	};
		if (oth.guild == GIL_WARAN)				{	return TRUE;	};
		if (oth.guild == GIL_LURKER)			{	return TRUE;	};
		if (oth.guild == GIL_SNAPPER)			{	return TRUE;	};
		// ------ Insekten ------
		if (oth.guild == GIL_MEATBUG)			{	return TRUE;	};
		if (oth.guild == GIL_GIANT_BUG)			{	return TRUE;	};
		if (oth.guild == GIL_BLOODFLY)			{	return TRUE;	};
		if (oth.guild == GIL_MINECRAWLER)		{	return TRUE;	};
	};
	
	// ------ Feldräuber frisst... ------
	if (slf.guild == GIL_GIANT_BUG)
	{
		// ------ Insekten ------
		if (oth.guild == GIL_MEATBUG)			{	return TRUE;	};
//		if (oth.guild == GIL_GIANT_BUG)			{	return TRUE;	};
		if (oth.guild == GIL_BLOODFLY)			{	return TRUE;	};
		if (oth.guild == GIL_MINECRAWLER)		{	return TRUE;	};
	};
	
	// ------ Waran frisst... ------
	if (slf.guild == GIL_WARAN) // Waren / Feuerwaran
	{
		// ------ Geflügel ------
		if (oth.guild == GIL_SCAVENGER)			{	return TRUE;	};
		if (oth.guild == GIL_HARPY)				{	return TRUE;	};
		// ------ Reptilien ------
		if (oth.guild == GIL_GOBBO)				{	return TRUE;	};
	};
	
	// ------ Wolf frisst... ------
	if (slf.guild == GIL_WOLF) && (slf.aivar[AIV_MM_REAL_ID] != ID_Keiler) // Wolf / Warg	
	{
		// ------ Menschen und Orks ------
		if (oth.guild < GIL_SEPERATOR_HUM)		{	return TRUE;	};
//		if (oth.guild > GIL_SEPERATOR_ORC)		{	return TRUE;	};
		// ------ klassische Beutetiere ------
		if (oth.guild == GIL_SHEEP)				{	return TRUE;	};
		if (oth.guild == GIL_GIANT_RAT)			{	return TRUE;	};
		if (oth.guild == GIL_MOLERAT) 			{	return TRUE;	};
	};
	
	// ------ Summoned Wolf frisst... ------
	if (slf.guild == GIL_SUMMONED_WOLF)
	{
		// ------ klassische Beutetiere ------
		if (oth.guild == GIL_SHEEP)				{	return TRUE;	};
		if (oth.guild == GIL_GIANT_RAT)			{	return TRUE;	};
		if (oth.guild == GIL_MOLERAT) 			{	return TRUE;	};
	};
	
	// ------ Minecrawler frisst... ------
	if (slf.guild == GIL_MINECRAWLER) // Minecrawler / Minecrawler Warrior
	{
		// ------ Menschen und Orks ------
		if (oth.guild < GIL_SEPERATOR_HUM)		{	return TRUE;	};
		if (oth.guild > GIL_SEPERATOR_ORC)		{	return TRUE;	};
		// ------ Insekten ------
		if (oth.guild == GIL_MEATBUG)			{	return TRUE;	};
		if (oth.guild == GIL_GIANT_BUG)			{	return TRUE;	};
		if (oth.guild == GIL_BLOODFLY)			{	return TRUE;	};
//		if (oth.guild == GIL_MINECRAWLER)		{	return TRUE;	};
	};
	
	// ------ Lurker frisst... ------
	if (slf.guild == GIL_LURKER)
	{
		// ------ Menschen und Orks ------
		if (oth.guild < GIL_SEPERATOR_HUM)		{	return TRUE;	};
		if (oth.guild > GIL_SEPERATOR_ORC)		{	return TRUE;	};
		// ------ Reptilien ------
		if (oth.guild == GIL_GOBBO)				{	return TRUE;	};
	};
	
	// ------ Zombie frisst... ------
	if (slf.guild == GIL_ZOMBIE)
	{
		// ------ Menschen und Orks ------
		if (oth.guild < GIL_SEPERATOR_HUM)		{	return TRUE;	};
		if (oth.guild > GIL_SEPERATOR_ORC)		{	return TRUE;	};
	};
	
	// ------ Snapper frisst... ------
	if (slf.guild == GIL_SNAPPER) // Snapper / Dragon Snapper
	{
		// ------ Menschen und Orks ------
		if (oth.guild < GIL_SEPERATOR_HUM)		{	return TRUE;	};
		if (oth.guild > GIL_SEPERATOR_ORC)		{	return TRUE;	};
		// ------ klassische Beutetiere ------
		if (oth.guild == GIL_SHEEP)				{	return TRUE;	};
		if (oth.guild == GIL_GIANT_RAT)			{	return TRUE;	};
		if (oth.guild == GIL_MOLERAT) 			{	return TRUE;	};
		// ------ Geflügel ------
		if (oth.guild == GIL_SCAVENGER)			{	return TRUE;	};
		if (oth.guild == GIL_HARPY)				{	return TRUE;	};
		// ------ Wild ------
		if (oth.guild == GIL_WOLF)				{	return TRUE;	};
		if (oth.guild == GIL_SUMMONED_WOLF)		{	return TRUE;	};
		if (oth.guild == GIL_SHADOWBEAST)		{	return TRUE;	};
		// ------ Reptilien ------
		if (oth.guild == GIL_GOBBO)				{	return TRUE;	};
		if (oth.guild == GIL_WARAN)				{	return TRUE;	};
		if (oth.guild == GIL_LURKER)			{	return TRUE;	};
//		if (oth.guild == GIL_SNAPPER)			{	return TRUE;	};
	};
	
	// ------ Shadowbeast frisst... ------
	if (slf.guild == GIL_SHADOWBEAST)
	{
		// ------ Menschen und Orks ------
		if (oth.guild < GIL_SEPERATOR_HUM)		{	return TRUE;	};
		if (oth.guild > GIL_SEPERATOR_ORC)		{	return TRUE;	};
		// ------ klassische Beutetiere ------
		if (oth.guild == GIL_SHEEP)				{	return TRUE;	};
		if (oth.guild == GIL_GIANT_RAT)			{	return TRUE;	};
		if (oth.guild == GIL_MOLERAT) 			{	return TRUE;	};
		// ------ Geflügel ------
		if (oth.guild == GIL_SCAVENGER)			{	return TRUE;	};
		if (oth.guild == GIL_HARPY)				{	return TRUE;	};
		// ------ Wild ------
		if (oth.guild == GIL_WOLF)				{	return TRUE;	};
		if (oth.guild == GIL_SUMMONED_WOLF)		{	return TRUE;	};
//		if (oth.guild == GIL_SHADOWBEAST)		{	return TRUE;	};
		// ------ Reptilien ------
		if (oth.guild == GIL_GOBBO)				{	return TRUE;	};
		if (oth.guild == GIL_WARAN)				{	return TRUE;	};
		if (oth.guild == GIL_LURKER)			{	return TRUE;	};
		if (oth.guild == GIL_SNAPPER)			{	return TRUE;	};
	};
	
	return FALSE;
};




		



