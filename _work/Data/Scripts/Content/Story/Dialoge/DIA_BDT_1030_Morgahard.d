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
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_01"); //Odkud zn� moje jm�no?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_02"); //Hled� t� soudce. Utekl jsi z v�zen�.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_03"); //Tak cos teda provedl: Ukradls mu pen�enku?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_04"); //Jemu ne. M�stodr��c�mu. Ale byli jsme v soudcov�ch slu�b�ch.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_05"); //Potom, co jsme m�stodr��c�ho obrali, se necht�l s n�mi pod�lit o ko�ist, a tak n�s str�il za m��e.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_06"); //Necht�li jsme se houpat na �ibenici, tak jsme utekli.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_07"); //M�m dojem, �e ztratili na�i stopu. Vypad� to, �e je z n� n�kdo svedl.

	Info_ClearChoices	(DIA_Morgahard_HALLO);
	Info_AddChoice	(DIA_Morgahard_HALLO, "P�esta� f�ukat a rad�i tas zbra�.", DIA_Morgahard_HALLO_attack );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Co mu provedeme?", DIA_Morgahard_HALLO_richter );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Soudce mi na��dil, abych t� zabil.", DIA_Morgahard_HALLO_tot );
	B_LogEntry (TOPIC_RichterLakai,"Na�el jsem Morgaharda, v�dce uprchl�k�."); 
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP (XP_FoundMorgahard);
};
func void DIA_Morgahard_HALLO_tot ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_tot_15_00"); //Soudce mi na��dil, abych t� zabil.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_tot_07_01"); //Jo, jasn�. Proto se� tady, ne?

};

func void DIA_Morgahard_HALLO_richter ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_00"); //Co mu provedeme?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_01"); //V�bec nic. Sed� si v horn� ��sti m�sta jako pavouk uprost�ed s�t� a nikdo na n�j nem��e.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_02"); //Tak jsem to nemyslel. Jen bychom pot�ebovali n�jak� d�kaz o jeho provin�n� v t� v�ci s m�stodr��c�m.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_03"); //Tak d�kaz, ��k�? N�co by se u m� i na�lo. Ale kdo by poslouchal trestan�ho krimin�ln�ka?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_04"); //Dej mi ten d�kaz a j� se postar�m o to, aby v�s u� nechali na pokoji.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_05"); //Ur�it�? Tak jo. Tady, vezmi si tenhle dopis. Je na n�m soudc�v podpis.
	B_GiveInvItems 		(self, other, ItWr_RichterKomproBrief_MIS, 1);					
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_06"); //I kdy� m� to nezbav� obvin�n�, m�lo by to sta�it jako d�kaz jeho spolu��asti na t� v�ci.
	B_LogEntry (TOPIC_RichterLakai,"Morgahard mi p�edal jist� soudn� dokument, kter� jasn� dokazuje, �e soudce m�stodr��c�ho Laria prachsprost� okradl. Mysl�m, �e p�esn� tohle po mn� cht�l Lee."); 
	AI_StopProcessInfos (self);
};
var int MorgahardSucked;
func void DIA_Morgahard_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_attack_15_00"); //P�esta� sku�et a chop se zbran�. Skon��me to hned.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_attack_07_01"); //M� pravdu, stejn� nem�m co ztratit.
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
	AI_Output			(self, other, "DIA_Morgahard_Perm_07_00"); //Ta soudnick� svin� - jednou se bude houpat na �ibenici.
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
	AI_Output			(self, other, "DIA_Morgahard_Perm2_07_00"); //Pro� se prost� neztrat�?
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


