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
	AI_Output (self, other,"DIA_Jergan_Hallo_13_01");//Pâicházím z hradu. Poslali mę, abych našel ty pohâešované a zkontroloval tuhle oblast.
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
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_01");//Nękterým se podaâilo uniknout, když zaútočili draci. Vętšina z nich to nestihla - a není divu!
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_02");//Ale pokud nękdo pâežil, vezmu ho s sebou zpátky.
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
	description = "Můžeš mi pomoct dostat se do hradu?";
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
	AI_Output (other, self,"DIA_Jergan_Burg_15_00");//Můžeš mi pomoct dostat se do hradu?
	AI_Output (self, other,"DIA_Jergan_Burg_13_01");//Jasnę, ale musíš mi prokázat laskavost.
	AI_Output (self, other,"DIA_Jergan_Burg_13_02");//Jestli se ti podaâí dostat se do hradu, promluv si s paladinem Oricem. Vyâië mu, že jeho bratr to tady v průsmyku koupil.
	
	Log_CreateTopic (Topic_OricBruder, LOG_MISSION);
	Log_SetTopicStatus (Topic_OricBruder,LOG_RUNNING);
	B_LogEntry (Topic_OricBruder,"Až se dostanu do hradu, musím Oricovi vyâídit, že jeho bratr zemâel v průsmyku.");
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
	description = "Co bych męl vędęt o této oblasti?";
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
		AI_Output (other, self,"DIA_Jergan_Gegend_15_00");//Co bych męl vędęt o této oblasti?
		AI_Output (self, other,"DIA_Jergan_Gegend_13_01");//Jestli chceš žít, vraă se, odkud jsi pâišel.
		AI_Output (self, other,"DIA_Jergan_Gegend_13_02");//Zelenokožci obléhají hrad už týdny - a nękde se tu ukrývají draci.
	};
	AI_Output (self, other,"DIA_Jergan_Gegend_13_03");//Celé Hornické údolí se hemží skâety - aă máš namíâeno kamkoliv, nebude to procházka růžovou zahradou.
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
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_01");//Na pâímou cestu rovnou zapomeŕ. Ale pokud obejdeš hrad, možná se tam dostaneš zezadu.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_02");//Męl bys zůstat mimo cestu a využít âeku. Nejlepší bude, když poplaveš po proudu. Odtud by to męlo být snazší.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_03");//Skâeti pâed hradem postavili beranidlo. Můžeš se dostat dovnitâ tímto způsobem - pâiplížíš se k tęm bastardům, jak jen to bude možné, a potom budeš upalovat, co to jen půjde.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_04");//Pokud budeš dostatečnę rychlý, męl bys to zvládnout.
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
	description = "Co tady dęláš?";
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
	AI_Output (other, self,"DIA_Jergan_Mine_15_00");//Co tady dęláš?
	AI_Output (self, other,"DIA_Jergan_Mine_13_01");//Jsem zvęd. Toulám se po kraji. Ale všichni ti chŕapavci mi to ztęžují.
	AI_Output (self, other,"DIA_Jergan_Mine_13_02");//Je vhodná doba k získání nęjakých trofejí - za pâedpokladu, že víš, co dęláš.
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
	description = "Naučíš mę, jak to dęlat?";
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
	AI_Output (other, self,"DIA_Jergan_Claw_15_00");//Naučíš mę, jak na to?
	AI_Output (self, other,"DIA_Jergan_Claw_13_01");//Můžu ti ukázat, jak z jejich mrtvol vytrhnout drápy.
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
	description = "(Naučit se vyjímat drápy.)";
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
		AI_Output (self, other,"DIA_Jergan_Teach_13_01");//Důležité je odstranit drápy škubnutím. Pâíliš neváhej a nerýpej čepelí.
		AI_Output (self, other,"DIA_Jergan_Teach_13_02");//Tímto způsobem nevytrhneš drápy jenom chŕapavcům, ale také ještęrům a stínovým šelmám.
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
	AI_Output (other, self,"DIA_Jergan_Diego_15_00");//Víš, kam se podęl Diego?
	AI_Output (self, other,"DIA_Jergan_Diego_13_01");//Diego? Byl jedním ze Silvestrových kopáčů. Ale vypaâil se.
	AI_Output (self, other,"DIA_Jergan_Diego_13_02");//Vidęl jsem ho nedaleko odtud se dvęmi rytíâi a krabicí.
	AI_Output (self, other,"DIA_Jergan_Diego_13_03");//Vidíš tady tu starou strážní vęž? Jdi tím smęrem a potom k hradu.
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
	AI_Output (self, other,"DIA_Jergan_Leader_13_00");//Tak ty jsi zabil vůdce smečky. A získal jsi z té bestie drápy?
	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_01");//Ano.
		AI_Output (self, other,"DIA_Jergan_Leader_13_02");//Ty musí mít jistę velkou cenu. Je tu nękolik chlapíků, kteâí takové vęci sbírají.
		AI_Output (self, other,"DIA_Jergan_Leader_13_03");//Pokud najdeš správného kupce, dostaneš za to kopec zlata.
	}
	else
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_04");//Ne.
		AI_Output (self, other,"DIA_Jergan_Leader_13_05");//Męl bys to udęlat. Jsem si jist, že za nę dostaneš majlant.
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














