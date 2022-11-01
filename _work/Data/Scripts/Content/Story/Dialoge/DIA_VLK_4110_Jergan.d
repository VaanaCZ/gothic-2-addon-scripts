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
	AI_Output (self, other,"DIA_Jergan_Hallo_13_01");//Przychodzę z zamku. Przysłali mnie, żebym poszukał zaginionych i sprawdził teren.
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
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_01");//Niektórzy uciekli, kiedy zaatakowały smoki. Większości się nie udało - no i nic dziwnego!
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_02");//Jeśli jednak komuś udało się przeżyć, mam go sprowadzić z powrotem.
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
	description = "Możesz mi pomóc dostać się do zamku?";
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
	AI_Output (other, self,"DIA_Jergan_Burg_15_00");//Możesz mi pomóc dostać się do zamku?
	AI_Output (self, other,"DIA_Jergan_Burg_13_01");//Pewnie, ale musisz coś dla mnie zrobić.
	AI_Output (self, other,"DIA_Jergan_Burg_13_02");//Jeżeli uda ci się dotrzeć do zamku, porozmawiaj z paladynem Orikiem. Powiedz mu, że jego brat poległ na przełęczy.
	
	Log_CreateTopic (Topic_OricBruder, LOG_MISSION);
	Log_SetTopicStatus (Topic_OricBruder,LOG_RUNNING);
	B_LogEntry (Topic_OricBruder,"Kiedy znajdę się w zamku, mam powiedzieć Orikowi, że jego brat poległ na przełęczy.");
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
	description = "Co powinienem wiedzieć o tej okolicy?";
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
		AI_Output (other, self,"DIA_Jergan_Gegend_15_00");//Co powinienem wiedzieć o tej okolicy?
		AI_Output (self, other,"DIA_Jergan_Gegend_13_01");//Wracaj, skąd przyszedłeś, jeśli ci życie miłe.
		AI_Output (self, other,"DIA_Jergan_Gegend_13_02");//Zielonoskórzy już od kilku tygodni oblegają zamek. A smoki gdzieś się ukrywają.
	};
	AI_Output (self, other,"DIA_Jergan_Gegend_13_03");//Cała Górnicza Dolina aż roi się od orków. Niezależnie od tego dokąd zmierzasz, to nie będzie majówka.
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
	description = "Jak mogę dostać się do zamku?";
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
	AI_Output (other, self,"DIA_Jergan_Hilfe_15_00");//Jak mogę dostać się do zamku?
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_01");//Po pierwsze zapomnij o drodze na wprost. Jeśli jednak obejdziesz zamek dookoła, może będziesz mieć jakieś szanse na powrót.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_02");//Trzymaj się z dala od ścieżek i skorzystaj z rzeki. Najlepiej będzie, jak popłyniesz kawałek w dół strumienia. Stamtąd powinno być łatwiej.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_03");//Orkowie ustawili za zamkiem taran. W ten sposób możesz się dostać do środka. Podkradnij się do orków, tak blisko jak zdołasz, a potem biegnij ile sił w nogach.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_04");//Jeżeli jesteś dostatecznie szybki, to może ci się udać.
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
	AI_Output (self, other,"DIA_Jergan_Mine_13_01");//Jestem zwiadowcą. Przemierzam kraj. Zębacze nie ułatwiają mi jednak zadania.
	AI_Output (self, other,"DIA_Jergan_Mine_13_02");//To dobry czas, żeby zdobyć kilka trofeów - zakładając, że wiesz, co robić.
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
	description = "Możesz mnie tego nauczyć?";
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
	AI_Output (other, self,"DIA_Jergan_Claw_15_00");//Możesz mnie tego nauczyć?
	AI_Output (self, other,"DIA_Jergan_Claw_13_01");//Mogę ci pokazać, jak zdjąć z tych stworów pazury, kiedy już będą martwe.
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
	AI_Output (other, self,"DIA_Jergan_Teach_15_00");//Pokaż mi, jak usuwać pazury.
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
	{
		AI_Output (self, other,"DIA_Jergan_Teach_13_01");//Najważniejsze jest to, żeby usunąć pazur jednym szarpnięciem. Nie wolno się wahać ani dłubać nożem.
		AI_Output (self, other,"DIA_Jergan_Teach_13_02");//Tym sposobem można zdobyć pazury nie tylko zębaczy, ale także jaszczurek i cieniostworów.
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
	description = "Wiesz, gdzie się podział Diego?";
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
	AI_Output (other, self,"DIA_Jergan_Diego_15_00");//Wiesz, gdzie się podział Diego?
	AI_Output (self, other,"DIA_Jergan_Diego_13_01");//Diego? To był jeden z kretów Silvestra. Ale się ulotnił.
	AI_Output (self, other,"DIA_Jergan_Diego_13_02");//Widziałem go z dwoma rycerzami i jakąś skrzynią, niedaleko stąd.
	AI_Output (self, other,"DIA_Jergan_Diego_13_03");//Widzisz stąd starą wieżę strażniczą, tak? Idź tam, a potem w stronę zamku.
	AI_Output (self, other,"DIA_Jergan_Diego_13_04");//Po prawej stronie jest ścieżka przez skały. Tamtędy właśnie poszli.
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
	AI_Output (self, other,"DIA_Jergan_Leader_13_00");//Więc zabiłeś przywódcę stada. Zabrałeś pazury tej bestii?
	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_01");//Tak.
		AI_Output (self, other,"DIA_Jergan_Leader_13_02");//Na pewno są dużą warte. Są tacy, co zbierają takie rzeczy.
		AI_Output (self, other,"DIA_Jergan_Leader_13_03");//Jeżeli znajdziesz dobrego kupca, to dostaniesz za to niezłą sumkę w złocie.
	}
	else
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_04");//Nie.
		AI_Output (self, other,"DIA_Jergan_Leader_13_05");//Powinieneś tak zrobić. Jestem pewien, że są warte fortunę.
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














