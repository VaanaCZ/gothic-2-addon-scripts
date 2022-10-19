///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Morgahard_EXIT   (C_INFO)
{
	npc         = BDT_1030_Morgahard;
	nr          = 999;
	condition   = DIA_Morgahard_EXIT_Condition;
	information = DIA_Morgahard_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_HALLO		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_HALLO_Condition;
	information	 = 	DIA_Morgahard_HALLO_Info;

	description	 = 	"Ty jsi Morgahard.";
};

func int DIA_Morgahard_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_00"); //Ty jsi Morgahard.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_01"); //Odkud znáš moje jméno?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_02"); //Hledá tê soudce. Utekl jsi z vêzení.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_03"); //Tak cos teda provedl: Ukradls mu penêženku?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_04"); //Jemu ne. Místodržícímu. Ale byli jsme v soudcových službách.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_05"); //Potom, co jsme místodržícího obrali, se nechtêl s námi podêlit o koâist, a tak nás strèil za mâíže.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_06"); //Nechtêli jsme se houpat na šibenici, tak jsme utekli.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_07"); //Mám dojem, že ztratili naši stopu. Vypadá to, že je z ní nêkdo svedl.

	Info_ClearChoices	(DIA_Morgahard_HALLO);
	Info_AddChoice	(DIA_Morgahard_HALLO, "Pâestaà fàukat a radši tas zbraà.", DIA_Morgahard_HALLO_attack );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Co mu provedeme?", DIA_Morgahard_HALLO_richter );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Soudce mi naâídil, abych tê zabil.", DIA_Morgahard_HALLO_tot );
	B_LogEntry (TOPIC_RichterLakai,"Našel jsem Morgaharda, vùdce uprchlíkù."); 
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP (XP_FoundMorgahard);
};
func void DIA_Morgahard_HALLO_tot ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_tot_15_00"); //Soudce mi naâídil, abych tê zabil.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_tot_07_01"); //Jo, jasnê. Proto seš tady, ne?

};

func void DIA_Morgahard_HALLO_richter ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_00"); //Co mu provedeme?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_01"); //Vùbec nic. Sedí si v horní èásti mêsta jako pavouk uprostâed sítê a nikdo na nêj nemùže.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_02"); //Tak jsem to nemyslel. Jen bychom potâebovali nêjaký dùkaz o jeho provinêní v té vêci s místodržícím.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_03"); //Tak dùkaz, âíkáš? Nêco by se u mê i našlo. Ale kdo by poslouchal trestanýho kriminálníka?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_04"); //Dej mi ten dùkaz a já se postarám o to, aby vás už nechali na pokoji.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_05"); //Urèitê? Tak jo. Tady, vezmi si tenhle dopis. Je na nêm soudcùv podpis.
	B_GiveInvItems 		(self, other, ItWr_RichterKomproBrief_MIS, 1);					
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_06"); //I když mê to nezbaví obvinêní, mêlo by to staèit jako dùkaz jeho spoluúèasti na tý vêci.
	B_LogEntry (TOPIC_RichterLakai,"Morgahard mi pâedal jistý soudní dokument, který jasnê dokazuje, že soudce místodržícího Laria prachsprostê okradl. Myslím, že pâesnê tohle po mnê chtêl Lee."); 
	AI_StopProcessInfos (self);
};
var int MorgahardSucked;
func void DIA_Morgahard_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_attack_15_00"); //Pâestaà skuèet a chop se zbranê. Skonèíme to hned.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_attack_07_01"); //Máš pravdu, stejnê nemám co ztratit.
	AI_StopProcessInfos (self);
	MorgahardSucked = TRUE;
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm		(C_INFO)
{
	npc		 = 	BDT_1030_Morgahard;
	nr		 = 	3;
	condition	 = 	DIA_Morgahard_Perm_Condition;
	information	 = 	DIA_Morgahard_Perm_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Morgahard_Perm_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Morgahard_HALLO))
	&& (MorgahardSucked == FALSE)

		{
			return TRUE;
		};	
};

func void DIA_Morgahard_Perm_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm_07_00"); //Ta soudnická svinê - jednou se bude houpat na šibenici.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm2		(C_INFO)
{
	npc			 = 	BDT_1030_Morgahard;
	nr			 = 	3;
	condition	 = 	DIA_Morgahard_Perm2_Condition;
	information	 = 	DIA_Morgahard_Perm2_Info;
	important	 = 	TRUE;
	Permanent	 = 	TRUE;

};
func int DIA_Morgahard_Perm2_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
	&& (MorgahardSucked == TRUE)
		{
			return TRUE;
		};	
};
func void DIA_Morgahard_Perm2_Info ()
{
	AI_Output			(self, other, "DIA_Morgahard_Perm2_07_00"); //Proè se prostê neztratíš?
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Morgahard_PICKPOCKET (C_INFO)
{
	npc			= BDT_1030_Morgahard;
	nr			= 900;
	condition	= DIA_Morgahard_PICKPOCKET_Condition;
	information	= DIA_Morgahard_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Morgahard_PICKPOCKET_Condition()
{
	C_Beklauen (73, 45);
};
 
FUNC VOID DIA_Morgahard_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Morgahard_PICKPOCKET);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_BACK 		,DIA_Morgahard_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Morgahard_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Morgahard_PICKPOCKET_DoIt);
};

func void DIA_Morgahard_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};
	
func void DIA_Morgahard_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Morgahard_PICKPOCKET);
};


