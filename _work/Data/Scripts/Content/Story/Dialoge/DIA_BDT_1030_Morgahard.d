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

	description	 = 	"Jesteœ Morgahard.";
};

func int DIA_Morgahard_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_00"); //Jesteœ Morgahard.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_01"); //Sk¹d wiesz, jak siê nazywam?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_02"); //Szuka ciê sêdzia. Uciek³eœ z wiêzienia.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_15_03"); //Jakie pope³ni³eœ przestêpstwo? Ukrad³eœ mu sakiewkê?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_04"); //Nie jemu. Gubernatorowi. I to w dodatku na polecenie sêdziego.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_05"); //Po tym jak zaatakowaliœmy gubernatora, nie chcia³ siê z nami podzieliæ ³upem, wiêc kaza³ nas aresztowaæ.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_06"); //Poniewa¿ nie chcieliœmy skoñczyæ na szubienicy, postanowiliœmy uciec.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_07_07"); //S¹dziliœmy, ¿e nigdy nie zdo³aj¹ nas z³apaæ. NajwyraŸniej siê pomyliliœmy.

	Info_ClearChoices	(DIA_Morgahard_HALLO);
	Info_AddChoice	(DIA_Morgahard_HALLO, "Przestañ jêczeæ i stawaj do walki.", DIA_Morgahard_HALLO_attack );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Czy mo¿emy w jakiœ sposób zdemaskowaæ sêdziego?", DIA_Morgahard_HALLO_richter );
	Info_AddChoice	(DIA_Morgahard_HALLO, "Sêdzia kaza³ mi was zabiæ.", DIA_Morgahard_HALLO_tot );
	B_LogEntry (TOPIC_RichterLakai,"Znalaz³em Morgaharda, przywódcê zbiegów."); 
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP (XP_FoundMorgahard);
};
func void DIA_Morgahard_HALLO_tot ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_tot_15_00"); //Sêdzia kaza³ mi was zabiæ.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_tot_07_01"); //Tak. Domyœli³em siê, ¿e po to tu przyszed³eœ.

};

func void DIA_Morgahard_HALLO_richter ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_00"); //Czy mo¿emy w jakiœ sposób zdemaskowaæ sêdziego?
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_01"); //Nie. To niemo¿liwe. M¹drala siedzi w górnym mieœcie i tylko poci¹ga za sznurki. Jest nietykalny.
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_02"); //Nie by³bym tego taki pewien. Potrzebny nam tylko jakiœ dowód jego udzia³u w zbrodni.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_03"); //Dowód, powiadasz? Mam dowód. Ale kto chcia³by s³uchaæ takiego recydywisty?
	AI_Output			(other, self, "DIA_Morgahard_HALLO_richter_15_04"); //Przeka¿ mi ten dowód, a dopilnujê, aby nikt ju¿ wiêcej na ciebie nie polowa³.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_05"); //Jesteœ pewien, ¿e chcesz siê w to mieszaæ? Dobrze, proszê. Oto list z podpisem sêdziego.
	B_GiveInvItems 		(self, other, ItWr_RichterKomproBrief_MIS, 1);					
	AI_Output			(self, other, "DIA_Morgahard_HALLO_richter_07_06"); //Nawet jeœli nie oczyœci mnie to z zarzutów, w zupe³noœci wystarczy, aby obci¹¿yæ czêœci¹ winy sêdziego.
	B_LogEntry (TOPIC_RichterLakai,"Morgahard da³ mi list od sêdziego, z którego jasno wynika, ¿e ten ostatni jest odpowiedzialny za obrabowanie Gubernatora Lariusa. S¹dzê, ¿e w³aœnie o taki dowód prosi³ mnie Lee."); 
	AI_StopProcessInfos (self);
};
var int MorgahardSucked;
func void DIA_Morgahard_HALLO_attack ()
{
	AI_Output			(other, self, "DIA_Morgahard_HALLO_attack_15_00"); //Przestañ jêczeæ i stawaj do walki. Najwy¿szy czas po³o¿yæ temu kres.
	AI_Output			(self, other, "DIA_Morgahard_HALLO_attack_07_01"); //Jeœli o mnie chodzi, to i tak nie mam nic do stracenia.
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
	AI_Output			(self, other, "DIA_Morgahard_Perm_07_00"); //Mam nadziejê, ¿e kiedyœ zobaczê tê œwiniê, sêdziego, dyndaj¹cego na stryczku.
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
	AI_Output			(self, other, "DIA_Morgahard_Perm2_07_00"); //Czemu po prostu nie zostawisz mnie w spokoju?
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


