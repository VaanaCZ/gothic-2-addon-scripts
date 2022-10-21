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
	description = "Co tady pohledáváš?";
};

FUNC INT DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hallo_15_00");//Co tady pohledáváš?
	AI_Output (self, other,"DIA_Jergan_Hallo_13_01");//Pøicházím z hradu. Poslali mì, abych našel ty pohøešované a zkontroloval tuhle oblast.
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
	description = "Pohøešované?";
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
	AI_Output (other, self,"DIA_Jergan_Vermisste_15_00");//Pohøešované?
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_01");//Nìkterým se podaøilo uniknout, když zaútoèili draci. Vìtšina z nich to nestihla - a není divu!
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_02");//Ale pokud nìkdo pøežil, vezmu ho s sebou zpátky.
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
	description = "Mùžeš mi pomoct dostat se do hradu?";
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
	AI_Output (other, self,"DIA_Jergan_Burg_15_00");//Mùžeš mi pomoct dostat se do hradu?
	AI_Output (self, other,"DIA_Jergan_Burg_13_01");//Jasnì, ale musíš mi prokázat laskavost.
	AI_Output (self, other,"DIA_Jergan_Burg_13_02");//Jestli se ti podaøí dostat se do hradu, promluv si s paladinem Oricem. Vyøiï mu, že jeho bratr to tady v prùsmyku koupil.
	
	Log_CreateTopic (Topic_OricBruder, LOG_MISSION);
	Log_SetTopicStatus (Topic_OricBruder,LOG_RUNNING);
	B_LogEntry (Topic_OricBruder,"Až se dostanu do hradu, musím Oricovi vyøídit, že jeho bratr zemøel v prùsmyku.");
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
	description = "Co bych mìl vìdìt o této oblasti?";
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
		AI_Output (other, self,"DIA_Jergan_Gegend_15_00");//Co bych mìl vìdìt o této oblasti?
		AI_Output (self, other,"DIA_Jergan_Gegend_13_01");//Jestli chceš žít, vra se, odkud jsi pøišel.
		AI_Output (self, other,"DIA_Jergan_Gegend_13_02");//Zelenokožci obléhají hrad už týdny - a nìkde se tu ukrývají draci.
	};
	AI_Output (self, other,"DIA_Jergan_Gegend_13_03");//Celé Hornické údolí se hemží skøety - a máš namíøeno kamkoliv, nebude to procházka rùžovou zahradou.
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
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_01");//Na pøímou cestu rovnou zapomeò. Ale pokud obejdeš hrad, možná se tam dostaneš zezadu.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_02");//Mìl bys zùstat mimo cestu a využít øeku. Nejlepší bude, když poplaveš po proudu. Odtud by to mìlo být snazší.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_03");//Skøeti pøed hradem postavili beranidlo. Mùžeš se dostat dovnitø tímto zpùsobem - pøiplížíš se k tìm bastardùm, jak jen to bude možné, a potom budeš upalovat, co to jen pùjde.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_04");//Pokud budeš dostateènì rychlý, mìl bys to zvládnout.
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
	description = "Co tady dìláš?";
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
	AI_Output (other, self,"DIA_Jergan_Mine_15_00");//Co tady dìláš?
	AI_Output (self, other,"DIA_Jergan_Mine_13_01");//Jsem zvìd. Toulám se po kraji. Ale všichni ti chòapavci mi to ztìžují.
	AI_Output (self, other,"DIA_Jergan_Mine_13_02");//Je vhodná doba k získání nìjakých trofejí - za pøedpokladu, že víš, co dìláš.
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
	description = "Nauèíš mì, jak to dìlat?";
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
	AI_Output (other, self,"DIA_Jergan_Claw_15_00");//Nauèíš mì, jak na to?
	AI_Output (self, other,"DIA_Jergan_Claw_13_01");//Mùžu ti ukázat, jak z jejich mrtvol vytrhnout drápy.
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
	description = "(Nauèit se vyjímat drápy.)";
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
	AI_Output (other, self,"DIA_Jergan_Teach_15_00");//Ukaž mi, jak vytrhnout drápy.
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
	{
		AI_Output (self, other,"DIA_Jergan_Teach_13_01");//Dùležité je odstranit drápy škubnutím. Pøíliš neváhej a nerýpej èepelí.
		AI_Output (self, other,"DIA_Jergan_Teach_13_02");//Tímto zpùsobem nevytrhneš drápy jenom chòapavcùm, ale také ještìrùm a stínovým šelmám.
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
	description = "Nevíš, kam až se Diego dostal?";
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
	AI_Output (other, self,"DIA_Jergan_Diego_15_00");//Víš, kam se podìl Diego?
	AI_Output (self, other,"DIA_Jergan_Diego_13_01");//Diego? Byl jedním ze Silvestrových kopáèù. Ale vypaøil se.
	AI_Output (self, other,"DIA_Jergan_Diego_13_02");//Vidìl jsem ho nedaleko odtud se dvìmi rytíøi a krabicí.
	AI_Output (self, other,"DIA_Jergan_Diego_13_03");//Vidíš tady tu starou strážní vìž? Jdi tím smìrem a potom k hradu.
	AI_Output (self, other,"DIA_Jergan_Diego_13_04");//Cesta vede skálami vpravo. To je ta cesta, kterou šli.
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
	AI_Output (self, other,"DIA_Jergan_Leader_13_00");//Tak ty jsi zabil vùdce smeèky. A získal jsi z té bestie drápy?
	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_01");//Ano.
		AI_Output (self, other,"DIA_Jergan_Leader_13_02");//Ty musí mít jistì velkou cenu. Je tu nìkolik chlapíkù, kteøí takové vìci sbírají.
		AI_Output (self, other,"DIA_Jergan_Leader_13_03");//Pokud najdeš správného kupce, dostaneš za to kopec zlata.
	}
	else
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_04");//Ne.
		AI_Output (self, other,"DIA_Jergan_Leader_13_05");//Mìl bys to udìlat. Jsem si jist, že za nì dostaneš majlant.
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














