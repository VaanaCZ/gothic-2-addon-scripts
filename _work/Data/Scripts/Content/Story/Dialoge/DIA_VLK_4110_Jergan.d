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
	AI_Output (self, other,"DIA_Jergan_Hallo_13_01");//Pâicházím z hradu. Poslali mê, abych našel ty pohâešované a zkontroloval tuhle oblast.
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
	description = "Pohâešované?";
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
	AI_Output (other, self,"DIA_Jergan_Vermisste_15_00");//Pohâešované?
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_01");//Nêkterým se podaâilo uniknout, když zaútoèili draci. Vêtšina z nich to nestihla - a není divu!
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_02");//Ale pokud nêkdo pâežil, vezmu ho s sebou zpátky.
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
	AI_Output (self, other,"DIA_Jergan_Burg_13_01");//Jasnê, ale musíš mi prokázat laskavost.
	AI_Output (self, other,"DIA_Jergan_Burg_13_02");//Jestli se ti podaâí dostat se do hradu, promluv si s paladinem Oricem. Vyâië mu, že jeho bratr to tady v prùsmyku koupil.
	
	Log_CreateTopic (Topic_OricBruder, LOG_MISSION);
	Log_SetTopicStatus (Topic_OricBruder,LOG_RUNNING);
	B_LogEntry (Topic_OricBruder,"Až se dostanu do hradu, musím Oricovi vyâídit, že jeho bratr zemâel v prùsmyku.");
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
	description = "Co bych mêl vêdêt o této oblasti?";
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
		AI_Output (other, self,"DIA_Jergan_Gegend_15_00");//Co bych mêl vêdêt o této oblasti?
		AI_Output (self, other,"DIA_Jergan_Gegend_13_01");//Jestli chceš žít, vraã se, odkud jsi pâišel.
		AI_Output (self, other,"DIA_Jergan_Gegend_13_02");//Zelenokožci obléhají hrad už týdny - a nêkde se tu ukrývají draci.
	};
	AI_Output (self, other,"DIA_Jergan_Gegend_13_03");//Celé Hornické údolí se hemží skâety - aã máš namíâeno kamkoliv, nebude to procházka rùžovou zahradou.
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
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_01");//Na pâímou cestu rovnou zapomeà. Ale pokud obejdeš hrad, možná se tam dostaneš zezadu.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_02");//Mêl bys zùstat mimo cestu a využít âeku. Nejlepší bude, když poplaveš po proudu. Odtud by to mêlo být snazší.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_03");//Skâeti pâed hradem postavili beranidlo. Mùžeš se dostat dovnitâ tímto zpùsobem - pâiplížíš se k têm bastardùm, jak jen to bude možné, a potom budeš upalovat, co to jen pùjde.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_04");//Pokud budeš dostateènê rychlý, mêl bys to zvládnout.
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
	description = "Co tady dêláš?";
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
	AI_Output (other, self,"DIA_Jergan_Mine_15_00");//Co tady dêláš?
	AI_Output (self, other,"DIA_Jergan_Mine_13_01");//Jsem zvêd. Toulám se po kraji. Ale všichni ti chàapavci mi to ztêžují.
	AI_Output (self, other,"DIA_Jergan_Mine_13_02");//Je vhodná doba k získání nêjakých trofejí - za pâedpokladu, že víš, co dêláš.
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
	description = "Nauèíš mê, jak to dêlat?";
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
	AI_Output (other, self,"DIA_Jergan_Claw_15_00");//Nauèíš mê, jak na to?
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
		AI_Output (self, other,"DIA_Jergan_Teach_13_01");//Dùležité je odstranit drápy škubnutím. Pâíliš neváhej a nerýpej èepelí.
		AI_Output (self, other,"DIA_Jergan_Teach_13_02");//Tímto zpùsobem nevytrhneš drápy jenom chàapavcùm, ale také ještêrùm a stínovým šelmám.
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
	AI_Output (other, self,"DIA_Jergan_Diego_15_00");//Víš, kam se podêl Diego?
	AI_Output (self, other,"DIA_Jergan_Diego_13_01");//Diego? Byl jedním ze Silvestrových kopáèù. Ale vypaâil se.
	AI_Output (self, other,"DIA_Jergan_Diego_13_02");//Vidêl jsem ho nedaleko odtud se dvêmi rytíâi a krabicí.
	AI_Output (self, other,"DIA_Jergan_Diego_13_03");//Vidíš tady tu starou strážní vêž? Jdi tím smêrem a potom k hradu.
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
		AI_Output (self, other,"DIA_Jergan_Leader_13_02");//Ty musí mít jistê velkou cenu. Je tu nêkolik chlapíkù, kteâí takové vêci sbírají.
		AI_Output (self, other,"DIA_Jergan_Leader_13_03");//Pokud najdeš správného kupce, dostaneš za to kopec zlata.
	}
	else
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_04");//Ne.
		AI_Output (self, other,"DIA_Jergan_Leader_13_05");//Mêl bys to udêlat. Jsem si jist, že za nê dostaneš majlant.
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














