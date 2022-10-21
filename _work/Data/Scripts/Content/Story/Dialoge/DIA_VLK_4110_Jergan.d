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
	description = "Co tady pohled�v�?";
};

FUNC INT DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hallo_15_00");//Co tady pohled�v�?
	AI_Output (self, other,"DIA_Jergan_Hallo_13_01");//P�ich�z�m z hradu. Poslali m�, abych na�el ty poh�e�ovan� a zkontroloval tuhle oblast.
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
	description = "Poh�e�ovan�?";
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
	AI_Output (other, self,"DIA_Jergan_Vermisste_15_00");//Poh�e�ovan�?
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_01");//N�kter�m se poda�ilo uniknout, kdy� za�to�ili draci. V�t�ina z nich to nestihla - a nen� divu!
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_02");//Ale pokud n�kdo p�e�il, vezmu ho s sebou zp�tky.
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
	description = "M��e� mi pomoct dostat se do hradu?";
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
	AI_Output (other, self,"DIA_Jergan_Burg_15_00");//M��e� mi pomoct dostat se do hradu?
	AI_Output (self, other,"DIA_Jergan_Burg_13_01");//Jasn�, ale mus� mi prok�zat laskavost.
	AI_Output (self, other,"DIA_Jergan_Burg_13_02");//Jestli se ti poda�� dostat se do hradu, promluv si s paladinem Oricem. Vy�i� mu, �e jeho bratr to tady v pr�smyku koupil.
	
	Log_CreateTopic (Topic_OricBruder, LOG_MISSION);
	Log_SetTopicStatus (Topic_OricBruder,LOG_RUNNING);
	B_LogEntry (Topic_OricBruder,"A� se dostanu do hradu, mus�m Oricovi vy��dit, �e jeho bratr zem�el v pr�smyku.");
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
	description = "Co bych m�l v�d�t o t�to oblasti?";
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
		AI_Output (other, self,"DIA_Jergan_Gegend_15_00");//Co bych m�l v�d�t o t�to oblasti?
		AI_Output (self, other,"DIA_Jergan_Gegend_13_01");//Jestli chce� ��t, vra� se, odkud jsi p�i�el.
		AI_Output (self, other,"DIA_Jergan_Gegend_13_02");//Zelenoko�ci obl�haj� hrad u� t�dny - a n�kde se tu ukr�vaj� draci.
	};
	AI_Output (self, other,"DIA_Jergan_Gegend_13_03");//Cel� Hornick� �dol� se hem�� sk�ety - a� m� nam��eno kamkoliv, nebude to proch�zka r��ovou zahradou.
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
	description = "Jak se dostanu do hradu?";
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
	AI_Output (other, self,"DIA_Jergan_Hilfe_15_00");//Jak se dostanu do hradu?
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_01");//Na p��mou cestu rovnou zapome�. Ale pokud obejde� hrad, mo�n� se tam dostane� zezadu.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_02");//M�l bys z�stat mimo cestu a vyu��t �eku. Nejlep�� bude, kdy� poplave� po proudu. Odtud by to m�lo b�t snaz��.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_03");//Sk�eti p�ed hradem postavili beranidlo. M��e� se dostat dovnit� t�mto zp�sobem - p�ipl�� se k t�m bastard�m, jak jen to bude mo�n�, a potom bude� upalovat, co to jen p�jde.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_04");//Pokud bude� dostate�n� rychl�, m�l bys to zvl�dnout.
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
	description = "Co tady d�l�?";
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
	AI_Output (other, self,"DIA_Jergan_Mine_15_00");//Co tady d�l�?
	AI_Output (self, other,"DIA_Jergan_Mine_13_01");//Jsem zv�d. Toul�m se po kraji. Ale v�ichni ti ch�apavci mi to zt�uj�.
	AI_Output (self, other,"DIA_Jergan_Mine_13_02");//Je vhodn� doba k z�sk�n� n�jak�ch trofej� - za p�edpokladu, �e v�, co d�l�.
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
	description = "Nau�� m�, jak to d�lat?";
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
	AI_Output (other, self,"DIA_Jergan_Claw_15_00");//Nau�� m�, jak na to?
	AI_Output (self, other,"DIA_Jergan_Claw_13_01");//M��u ti uk�zat, jak z jejich mrtvol vytrhnout dr�py.
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
	description = "(Nau�it se vyj�mat dr�py.)";
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
	AI_Output (other, self,"DIA_Jergan_Teach_15_00");//Uka� mi, jak vytrhnout dr�py.
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
	{
		AI_Output (self, other,"DIA_Jergan_Teach_13_01");//D�le�it� je odstranit dr�py �kubnut�m. P��li� nev�hej a ner�pej �epel�.
		AI_Output (self, other,"DIA_Jergan_Teach_13_02");//T�mto zp�sobem nevytrhne� dr�py jenom ch�apavc�m, ale tak� je�t�r�m a st�nov�m �elm�m.
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
	description = "Nev�, kam a� se Diego dostal?";
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
	AI_Output (other, self,"DIA_Jergan_Diego_15_00");//V�, kam se pod�l Diego?
	AI_Output (self, other,"DIA_Jergan_Diego_13_01");//Diego? Byl jedn�m ze Silvestrov�ch kop���. Ale vypa�il se.
	AI_Output (self, other,"DIA_Jergan_Diego_13_02");//Vid�l jsem ho nedaleko odtud se dv�mi ryt��i a krabic�.
	AI_Output (self, other,"DIA_Jergan_Diego_13_03");//Vid� tady tu starou str�n� v�? Jdi t�m sm�rem a potom k hradu.
	AI_Output (self, other,"DIA_Jergan_Diego_13_04");//Cesta vede sk�lami vpravo. To je ta cesta, kterou �li.
};
///////////////////////////////////////////////////////////////////////
//	Rudelf�hrer get�tet
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
	AI_Output (self, other,"DIA_Jergan_Leader_13_00");//Tak ty jsi zabil v�dce sme�ky. A z�skal jsi z t� bestie dr�py?
	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_01");//Ano.
		AI_Output (self, other,"DIA_Jergan_Leader_13_02");//Ty mus� m�t jist� velkou cenu. Je tu n�kolik chlap�k�, kte�� takov� v�ci sb�raj�.
		AI_Output (self, other,"DIA_Jergan_Leader_13_03");//Pokud najde� spr�vn�ho kupce, dostane� za to kopec zlata.
	}
	else
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_04");//Ne.
		AI_Output (self, other,"DIA_Jergan_Leader_13_05");//M�l bys to ud�lat. Jsem si jist, �e za n� dostane� majlant.
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














