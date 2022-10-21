///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_EXIT   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 999;
	condition   = DIA_Jergan_EXIT_Condition;
	information = DIA_Jergan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jergan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Hallo   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 2;
	condition   = DIA_Jergan_Hallo_Condition;
	information = DIA_Jergan_Hallo_Info;
	permanent   = FALSE;
	description = "Czemu tu tak stoisz?";
};

FUNC INT DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hallo_15_00");//Czemu tu tak stoisz?
	AI_Output (self, other,"DIA_Jergan_Hallo_13_01");//Przychodzê z zamku. Przys³ali mnie, ¿ebym poszuka³ zaginionych i sprawdzi³ teren.
};
///////////////////////////////////////////////////////////////////////
//	Info Vermisste
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Vermisste   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 2;
	condition   = DIA_Jergan_Vermisste_Condition;
	information = DIA_Jergan_Vermisste_Info;
	permanent   = FALSE;
	description = "Zaginionych?";
};

FUNC INT DIA_Jergan_Vermisste_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Vermisste_Info()
{
	AI_Output (other, self,"DIA_Jergan_Vermisste_15_00");//Zaginionych?
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_01");//Niektórzy uciekli, kiedy zaatakowa³y smoki. Wiêkszoœci siê nie uda³o - no i nic dziwnego!
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_02");//Jeœli jednak komuœ uda³o siê prze¿yæ, mam go sprowadziæ z powrotem.
};
///////////////////////////////////////////////////////////////////////
//	Info Burg 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Burg   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Burg_Condition;
	information = DIA_Jergan_Burg_Info;
	permanent   = FALSE;
	description = "Mo¿esz mi pomóc dostaæ siê do zamku?";
};

FUNC INT DIA_Jergan_Burg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	&& (Npc_GetDistToWP (self, "OW_STAND_JERGAN") <= 1000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Burg_Info()
{
	AI_Output (other, self,"DIA_Jergan_Burg_15_00");//Mo¿esz mi pomóc dostaæ siê do zamku?
	AI_Output (self, other,"DIA_Jergan_Burg_13_01");//Pewnie, ale musisz coœ dla mnie zrobiæ.
	AI_Output (self, other,"DIA_Jergan_Burg_13_02");//Je¿eli uda ci siê dotrzeæ do zamku, porozmawiaj z paladynem Orikiem. Powiedz mu, ¿e jego brat poleg³ na prze³êczy.
	
	Log_CreateTopic (Topic_OricBruder, LOG_MISSION);
	Log_SetTopicStatus (Topic_OricBruder,LOG_RUNNING);
	B_LogEntry (Topic_OricBruder,"Kiedy znajdê siê w zamku, mam powiedzieæ Orikowi, ¿e jego brat poleg³ na prze³êczy.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gegend
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Gegend   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Gegend_Condition;
	information = DIA_Jergan_Gegend_Info;
	permanent   = TRUE;
	description = "Co powinienem wiedzieæ o tej okolicy?";
};

FUNC INT DIA_Jergan_Gegend_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	{
		return TRUE;
	};
};
var int Jergan_Tell;
FUNC VOID DIA_Jergan_Gegend_Info()
{
	if (Jergan_Tell == FALSE)
	{
		AI_Output (other, self,"DIA_Jergan_Gegend_15_00");//Co powinienem wiedzieæ o tej okolicy?
		AI_Output (self, other,"DIA_Jergan_Gegend_13_01");//Wracaj, sk¹d przyszed³eœ, jeœli ci ¿ycie mi³e.
		AI_Output (self, other,"DIA_Jergan_Gegend_13_02");//Zielonoskórzy ju¿ od kilku tygodni oblegaj¹ zamek. A smoki gdzieœ siê ukrywaj¹.
	};
	AI_Output (self, other,"DIA_Jergan_Gegend_13_03");//Ca³a Górnicza Dolina a¿ roi siê od orków. Niezale¿nie od tego dok¹d zmierzasz, to nie bêdzie majówka.
	Jergan_Tell = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Hilfe   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Hilfe_Condition;
	information = DIA_Jergan_Hilfe_Info;
	permanent   = FALSE;
	description = "Jak mogê dostaæ siê do zamku?";
};

FUNC INT DIA_Jergan_Hilfe_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Burg)
	&& (Npc_GetDistToWP (self, "OW_STAND_JERGAN") <= 1000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Hilfe_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hilfe_15_00");//Jak mogê dostaæ siê do zamku?
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_01");//Po pierwsze zapomnij o drodze na wprost. Jeœli jednak obejdziesz zamek dooko³a, mo¿e bêdziesz mieæ jakieœ szanse na powrót.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_02");//Trzymaj siê z dala od œcie¿ek i skorzystaj z rzeki. Najlepiej bêdzie, jak pop³yniesz kawa³ek w dó³ strumienia. Stamt¹d powinno byæ ³atwiej.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_03");//Orkowie ustawili za zamkiem taran. W ten sposób mo¿esz siê dostaæ do œrodka. Podkradnij siê do orków, tak blisko jak zdo³asz, a potem biegnij ile si³ w nogach.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_04");//Je¿eli jesteœ dostatecznie szybki, to mo¿e ci siê udaæ.
};


//2. Begegnung
///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Mine   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Mine_Condition;
	information = DIA_Jergan_Mine_Info;
	permanent   = FALSE;
	description = "Co tu porabiasz?";
};

FUNC INT DIA_Jergan_Mine_Condition()
{	
	if( Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Mine_Info()
{
	AI_Output (other, self,"DIA_Jergan_Mine_15_00");//Co tutaj robisz?
	AI_Output (self, other,"DIA_Jergan_Mine_13_01");//Jestem zwiadowc¹. Przemierzam kraj. Zêbacze nie u³atwiaj¹ mi jednak zadania.
	AI_Output (self, other,"DIA_Jergan_Mine_13_02");//To dobry czas, ¿eby zdobyæ kilka trofeów - zak³adaj¹c, ¿e wiesz, co robiæ.
};
///////////////////////////////////////////////////////////////////////
//	Klauen reissen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Claw   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Claw_Condition;
	information = DIA_Jergan_Claw_Info;
	permanent   = FALSE;
	description = "Mo¿esz mnie tego nauczyæ?";
};

FUNC INT DIA_Jergan_Claw_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_KnowsInfo (other, DIA_Jergan_Mine)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Claw_Info()
{
	AI_Output (other, self,"DIA_Jergan_Claw_15_00");//Mo¿esz mnie tego nauczyæ?
	AI_Output (self, other,"DIA_Jergan_Claw_13_01");//Mogê ci pokazaæ, jak zdj¹æ z tych stworów pazury, kiedy ju¿ bêd¹ martwe.
};
///////////////////////////////////////////////////////////////////////
//	Klauen reissen lernen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Teach   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Teach_Condition;
	information = DIA_Jergan_Teach_Info;
	permanent   = TRUE;
	description = "(Nauka usuwania pazurów)";
};
FUNC INT DIA_Jergan_Teach_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_KnowsInfo (other, DIA_Jergan_Claw)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Teach_Info()
{
	AI_Output (other, self,"DIA_Jergan_Teach_15_00");//Poka¿ mi, jak usuwaæ pazury.
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
	{
		AI_Output (self, other,"DIA_Jergan_Teach_13_01");//Najwa¿niejsze jest to, ¿eby usun¹æ pazur jednym szarpniêciem. Nie wolno siê wahaæ ani d³ubaæ no¿em.
		AI_Output (self, other,"DIA_Jergan_Teach_13_02");//Tym sposobem mo¿na zdobyæ pazury nie tylko zêbaczy, ale tak¿e jaszczurek i cieniostworów.
	};
};
///////////////////////////////////////////////////////////////////////
//	Diego
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Diego   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Diego_Condition;
	information = DIA_Jergan_Diego_Info;
	permanent   = FALSE;
	description = "Wiesz, gdzie siê podzia³ Diego?";
};

FUNC INT DIA_Jergan_Diego_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& (Npc_KnowsInfo (other, DIA_DiegoOw_Hallo) == FALSE)
	&& Npc_KnowsInfo (other,DIA_Parcival_Diego)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Diego_Info()
{
	AI_Output (other, self,"DIA_Jergan_Diego_15_00");//Wiesz, gdzie siê podzia³ Diego?
	AI_Output (self, other,"DIA_Jergan_Diego_13_01");//Diego? To by³ jeden z kretów Silvestra. Ale siê ulotni³.
	AI_Output (self, other,"DIA_Jergan_Diego_13_02");//Widzia³em go z dwoma rycerzami i jak¹œ skrzyni¹, niedaleko st¹d.
	AI_Output (self, other,"DIA_Jergan_Diego_13_03");//Widzisz st¹d star¹ wie¿ê stra¿nicz¹, tak? IdŸ tam, a potem w stronê zamku.
	AI_Output (self, other,"DIA_Jergan_Diego_13_04");//Po prawej stronie jest œcie¿ka przez ska³y. Tamtêdy w³aœnie poszli.
};
///////////////////////////////////////////////////////////////////////
//	Rudelführer getötet
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Jergan_Leader   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Leader_Condition;
	information = DIA_Jergan_Leader_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Jergan_Leader_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_IsDead(NewMine_LeadSnapper) 
	&& Npc_KnowsInfo (other,DIA_Bilgot_KNOWSLEADSNAPPER)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Leader_Info()
{
	AI_Output (self, other,"DIA_Jergan_Leader_13_00");//Wiêc zabi³eœ przywódcê stada. Zabra³eœ pazury tej bestii?
	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_01");//Tak.
		AI_Output (self, other,"DIA_Jergan_Leader_13_02");//Na pewno s¹ du¿¹ warte. S¹ tacy, co zbieraj¹ takie rzeczy.
		AI_Output (self, other,"DIA_Jergan_Leader_13_03");//Je¿eli znajdziesz dobrego kupca, to dostaniesz za to niez³¹ sumkê w z³ocie.
	}
	else
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_04");//Nie.
		AI_Output (self, other,"DIA_Jergan_Leader_13_05");//Powinieneœ tak zrobiæ. Jestem pewien, ¿e s¹ warte fortunê.
	};	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jergan_PICKPOCKET (C_INFO)
{
	npc			= VLK_4110_Jergan;
	nr			= 900;
	condition	= DIA_Jergan_PICKPOCKET_Condition;
	information	= DIA_Jergan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Jergan_PICKPOCKET_Condition()
{
	C_Beklauen (84, 110);
};
 
FUNC VOID DIA_Jergan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jergan_PICKPOCKET);
	Info_AddChoice		(DIA_Jergan_PICKPOCKET, DIALOG_BACK 		,DIA_Jergan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jergan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jergan_PICKPOCKET_DoIt);
};

func void DIA_Jergan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jergan_PICKPOCKET);
};
	
func void DIA_Jergan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jergan_PICKPOCKET);
};














