// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Keroloth_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_EXIT_Condition;
	information	= DIA_Keroloth_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Keroloth_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//**************************************************************
//	Ansprechen 
//**************************************************************
INSTANCE DIA_Keroloth_HELLO(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 2;
	condition	= DIA_Keroloth_HELLO_Condition;
	information	= DIA_Keroloth_HELLO_Info;
	permanent	= FALSE;
	important	= TRUE;	
};                       

FUNC INT DIA_Keroloth_HELLO_Condition()
{
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_HELLO_Info()
{	
	AI_Output	(other ,self,"DIA_Keroloth_HELLO_15_00"); //Ty tady trénuješ ostatní?
	AI_Output	(self ,other,"DIA_Keroloth_HELLO_07_01"); //Ano. Až ti skâeti, nebo ještê hùâ draci znovu zaútoèí, bude každá ruka dobrá.
};
//***********************************************
//	Kannst DU mir was beibringen
//***********************************************

INSTANCE DIA_Keroloth_WantTeach(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 3;
	condition	= DIA_Keroloth_WantTeach_Condition;
	information	= DIA_Keroloth_WantTeach_Info;
	permanent	= FALSE;
	description = "Mùžeš nêco nauèit i mê?";
};                       

FUNC INT DIA_Keroloth_WantTeach_Condition()
{
	if (Keroloths_BeutelLeer == FALSE)
	{
	 	return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_WantTeach_Info()
{	
	AI_Output 	(other,self ,"DIA_Keroloth_WantTeach_15_00"); //Mùžeš nêco nauèit i mê?
	AI_Output 	(self ,other,"DIA_Keroloth_WantTeach_07_01"); //Samozâejmê. Trénuji každého slušného èlovêka.
	AI_Output 	(self ,other,"DIA_Keroloth_WantTeach_07_02"); //Ale pokud tady chceš pâežít, budeš potâebovat kromê talentu i nêjakou dobrou zbraà.
	AI_Output 	(self ,other,"DIA_Keroloth_WantTeach_07_03"); //Požádej rytíâe Tandora. Postará se o tebe.
		
	Keroloth_TeachPlayer = TRUE;
	Log_CreateTopic (TOPIC_Teacher_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Teacher_OC,"Keroloth na hradê trénuje bojovníky s meèem.");
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Tandor na hradê obchoduje se zbranêmi.");
};
//***********************************************
//	Kampflehrer EINHAND
//***********************************************

INSTANCE DIA_Keroloth_Teacher(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 6;
	condition	= DIA_Keroloth_Teacher_Condition;
	information	= DIA_Keroloth_Teacher_Info;
	permanent	= TRUE;
	description = "(Nauèit se jednoruènímu boji.)";
};                       

FUNC INT DIA_Keroloth_Teacher_Condition()
{
	if (Keroloth_TeachPlayer == TRUE)
	&& (Keroloths_BeutelLeer == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_Teacher_Info()
{	
	AI_Output 	(other,self ,"DIA_Keroloth_Teacher_15_00"); //Chci se uèit!
	
	Info_ClearChoices 	(DIA_Keroloth_Teacher);
	Info_AddChoice 		(DIA_Keroloth_Teacher,DIALOG_BACK,DIA_Keroloth_Teacher_Back);
	Info_AddChoice		(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Keroloth_Teacher_1H_1);
	Info_AddChoice		(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Keroloth_Teacher_1H_5);
};

FUNC VOID DIA_Keroloth_Teacher_Back ()
{
	Info_ClearChoices (DIA_Keroloth_Teacher);
};

FUNC VOID B_Keroloth_TeachNoMore1 ()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore1_07_00"); //Jsi velice dobrý. Už není nic, co bych tê mohl nauèit.
};

FUNC VOID B_Keroloth_TeachNoMore2 ()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore2_07_00"); //Mùže ti pomoci už jen zkušený mistr meèe.
};

FUNC VOID DIA_Keroloth_Teacher_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 60);
	
	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		B_Keroloth_TeachNoMore1	();
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_1H) == 2)
		{
			B_Keroloth_TeachNoMore2	();
		};
	};
	Info_AddChoice		(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Keroloth_Teacher_1H_1);
};

FUNC VOID DIA_Keroloth_Teacher_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 60);
	
	if (other.HitChance[NPC_TALENT_1H] >= 60)
	{
		B_Keroloth_TeachNoMore1	();
		
		if (Npc_GetTalentSkill (other, NPC_TALENT_1H) == 2)
		{
			B_Keroloth_TeachNoMore2	();
		};
	};
	Info_AddChoice		(DIA_Keroloth_Teacher, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Keroloth_Teacher_1H_5);
};
//**************************************
//		Kampflehrer ZWEIHAND
//**************************************
INSTANCE DIA_Keroloth_Teach(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 100;
	condition	= DIA_Keroloth_Teach_Condition;
	information	= DIA_Keroloth_Teach_Info;
	permanent	= TRUE;
	description = "(Osvojit si dovednost obouruèního boje)";
};                       
//----------------------------------
var int DIA_Keroloth_Teach_permanent;
//----------------------------------
FUNC INT DIA_Keroloth_Teach_Condition()
{
	if (Keroloth_TeachPlayer == TRUE)
	&& (Keroloths_BeutelLeer == FALSE)
	&& (DIA_Keroloth_Teach_permanent == FALSE)
	&& (other.HitChance[NPC_TALENT_2H] < 60)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Keroloth_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Keroloth_Teach_15_00"); //Zaènême.
	
	Info_ClearChoices 	(DIA_Keroloth_Teach);
	Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Keroloth_Teach_2H_1);
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Keroloth_Teach_2H_5);

};
FUNC VOID DIA_Keroloth_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 60)
	{
		B_Keroloth_TeachNoMore1	();
		
		DIA_Keroloth_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Keroloth_Teach);
};

FUNC VOID DIA_Keroloth_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 60);
	
	Info_ClearChoices 	(DIA_Keroloth_Teach);
	Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Keroloth_Teach_2H_1);	
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Keroloth_Teach_2H_5);	
};

FUNC VOID DIA_Keroloth_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 60);
	
	Info_ClearChoices 	(DIA_Keroloth_Teach);
	Info_AddChoice 		(DIA_Keroloth_Teach,	DIALOG_BACK		,DIA_Keroloth_Teach_Back);
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Keroloth_Teach_2H_1);	
	Info_AddChoice		(DIA_Keroloth_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Keroloth_Teach_2H_5);	
};
//************************************
//	Suche andere Lehrer
//************************************

INSTANCE DIA_Keroloth_Udar(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 4;
	condition	= DIA_Keroloth_Udar_Condition;
	information	= DIA_Keroloth_Udar_Info;
	permanent	= FALSE;
	description = "A co boj na dálku?";
};                       

FUNC INT DIA_Keroloth_Udar_Condition()
{
	if (Keroloth_TeachPlayer == TRUE)
	&& (Keroloths_BeutelLeer == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Keroloth_Udar_Info()
{	
	AI_Output 	(other,self ,"DIA_Keroloth_Udar_15_00"); //A co boj na dálku?
	AI_Output	(self ,other,"DIA_Keroloth_Udar_07_01"); //Co je s ním?
	AI_Output 	(other,self ,"DIA_Keroloth_Udar_15_02"); //Mùžeš mê trénovat i v nêm?
	AI_Output	(self ,other,"DIA_Keroloth_Udar_07_03"); //Ne, ale mùžeš se zeptat Udara, je to dobrý - ne, je to NEJLEPŠÍ stâelec z kuše, jakého znám.
	
	
	Log_CreateTopic	(TOPIC_Teacher_OC, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher_OC, "Udar z hradu v Hornickém údolí ví o kuších snad všechno, co lze znát.");
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Keroloth_KAP3_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_KAP3_EXIT_Condition;
	information	= DIA_Keroloth_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Keroloth_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Keroloth_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Keroloth_KAP4_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_KAP4_EXIT_Condition;
	information	= DIA_Keroloth_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Keroloth_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Keroloth_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kap4_Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_HELLO		(C_INFO)
{
	npc		 = 	PAL_258_Keroloth;
	nr		 = 	40;
	condition	 = 	DIA_Keroloth_KAP4_HELLO_Condition;
	information	 = 	DIA_Keroloth_KAP4_HELLO_Info;

	description	 = 	"Nêjak protahuješ oblièej.";
};

func int DIA_Keroloth_KAP4_HELLO_Condition ()
{
	if (Kapitel >= 4)	
		{
				return TRUE;
		};
};

func void DIA_Keroloth_KAP4_HELLO_Info ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_15_00"); //Nêjak protahuješ oblièej.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_07_01"); //(nahnêvanê) Zatracenê. Jak povídám, jeden musí být jako ostâíž.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_07_02"); //Na chvíli se otoèíš zády a hned ti zaènou mizet vêci. Ksakru!

	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, DIALOG_BACK, DIA_Keroloth_KAP4_HELLO_ende );
	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Paladin by se nemêl nikdy pâestat ovládat.", DIA_Keroloth_KAP4_HELLO_ruhig );
 	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Nêkdo ti nêco ukradl?", DIA_Keroloth_KAP4_HELLO_bestohlen );
	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Kdo to podle tebe byl?", DIA_Keroloth_KAP4_HELLO_pack );


};
func void DIA_Keroloth_KAP4_HELLO_ende ()
{
	Info_ClearChoices	(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_bestohlen ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_15_00"); //Nêkdo ti nêco ukradl?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_07_01"); //Ne. Nêkdo mi strèil do kapsy 20 zlatých. Samozâejmê že mi nêkdo nêco ukradl, blbeèku!
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_07_02"); //Ale to ti povídám, až se mi ta prašivá svinê dostane do rukou...

	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "A co ti chybí?", DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt );
};
func void DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00"); //A co ti chybí?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01"); //Mêšec - mêl jsem v nêm všechny své úspory.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02"); //A teë je pryè!
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03"); //Urèitê se nêkde objeví.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04"); //Až se mi dostane do rukou...

	Log_CreateTopic (TOPIC_KerolothsGeldbeutel, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KerolothsGeldbeutel, LOG_RUNNING);
	B_LogEntry (TOPIC_KerolothsGeldbeutel,"Paladinu Kerolothovi se ztratila portmonka a tvrdí, že mu ji uzmuli drakobijci."); 


	Info_ClearChoices	(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_pack ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_pack_15_00"); //Kdo to podle tebe byl?
	
	if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_01"); //Nêkdo z vás parchantù drakobijcù, samozâejmê. Kdo jiný?
		}
	else
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_02"); //Samozâejmê nêkdo z té drakobijecké chátry. O kom jiném bych asi tak mluvil?
		};
		
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_03"); //(pro sebe) Povídám, že je zapotâebí mít je poâád na oèích.
};

func void DIA_Keroloth_KAP4_HELLO_ruhig ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_ruhig_15_00"); //Uklidni se! Paladin by se nemêl pâestat ovládat.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_ruhig_07_01"); //Ale já se nechci uklidnit. Bylo to zatracenê všechno, co jsem mêl!
};


///////////////////////////////////////////////////////////////////////
//	Info GELDGEFUNDEN
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_GELDGEFUNDEN		(C_INFO)
{
	npc		 = 	PAL_258_Keroloth;
	nr		 = 	42;
	condition	 = 	DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition;
	information	 = 	DIA_Keroloth_KAP4_GELDGEFUNDEN_Info;

	description	 = 	"Asi jsem našel tvùj mêšec.";
};

func int DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Keroloth_KAP4_HELLO))
		&& 	(
			(Npc_HasItems (other,ItMi_KerolothsGeldbeutel_MIS))
			|| (Npc_HasItems (other,ItMi_KerolothsGeldbeutelLeer_MIS))
			)		
		{
				return TRUE;
		};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Info ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00"); //Asi jsem našel tvùj mêšec.
	TOPIC_END_KerolothsGeldbeutel = TRUE;
	B_GivePlayerXP (XP_KerolothsGeldbeutel);
	if (B_GiveInvItems (other, self, ItMi_KerolothsGeldbeutelLeer_MIS,1))
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01"); //Je prázdný. Která svinê to udêlala?
	
		Keroloths_BeutelLeer = TRUE;
	};
	if (B_GiveInvItems (other, self, ItMi_KerolothsGeldbeutel_MIS,1))
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02"); //Co? Kde? Který parchant to udêlal?
	};
	
	if (hero.guild == GIL_DJG)
	{
		Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Momentíèek - jaká bude odmêna?", DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn );
	};

	Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Byl tady hned u kovárny.", DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede );
	Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Podezírám nêkoho z drakobijcù.", DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG );
	Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Jak bych to mohl vêdêt?", DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung);
};
func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00"); //Jak bych to mohl vêdêt?

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01"); //Dêláš si ze mê legraci? Pâiznej se, žes to byl ty.
		
		Info_ClearChoices	(DIA_Keroloth_KAP4_GELDGEFUNDEN);
		Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Podezírám nêkoho z drakobijcù.", DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG );
		Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Polib mi.", DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich );
	}
	else
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02"); //To ještê zjistím.
		AI_StopProcessInfos (self);
	};
};
func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_kannstmich_15_00"); //Polib mi.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_kannstmich_07_01"); //Já ti ukážu, okrádat poctivé lidi.

	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00"); //Podezírám jednoho z drakobijcù.
		
	AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01"); //(rozzlobenê) Já to vêdêl.
	
	if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02"); //(kâièí) Nikdy tê nemêli pouštêt do hradu.
		}
		else
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_03"); //Jen poèkej, já dám té svini co proto.
		};

	AI_StopProcessInfos	(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;

	if (Npc_IsDead(Ferros) == FALSE)
		&& ((Npc_GetDistToNpc(self, Ferros)) <= 2000)
		{
			B_Attack (self, Ferros, AR_NONE, 1);
		}
	else if (Npc_IsDead(Jan) == FALSE)
		&& ((Npc_GetDistToNpc(self, Jan)) <= 2000)
		{
			B_Attack (self, Jan, AR_NONE, 1);
		}
	else if (Npc_IsDead(Rethon) == FALSE)
		&& ((Npc_GetDistToNpc(self, Rethon)) <= 2000)
		{
			B_Attack (self, Rethon, AR_NONE, 1);
		};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00"); //Ehm. Byl tady, hned vedle kovárny.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01"); //Kde? Poblíž kovárny? Urèitê vypadl jednomu z têch drakobijcù z kapsy, neâíkej, že ne.
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00"); //Poèkej. A co odmêna?
	
 	if (Keroloths_BeutelLeer == TRUE)
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01"); //Tak to je poslední kapka. Už dlouho ti nikdo pêstí nepâepoèítal zuby, co?
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02"); //Arrh. Dobrá. Tady je pár zlatých. A teë mi âekneš, kdo to udêlal?
		CreateInvItems (self, ItMi_Gold, 50);									
		B_GiveInvItems (self, other, ItMi_Gold, 50);					
		Keroloth_HasPayed = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_BELOHNUNG		(C_INFO)
{
	npc		 = 	PAL_258_Keroloth;
	nr		 = 	43;
	condition	 = 	DIA_Keroloth_KAP4_BELOHNUNG_Condition;
	information	 = 	DIA_Keroloth_KAP4_BELOHNUNG_Info;
	permanent	 = 	TRUE;

	description	 = 	"Chci nálezné za tvùj mêšec.";
};

func int DIA_Keroloth_KAP4_BELOHNUNG_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Keroloth_KAP4_GELDGEFUNDEN))
 		&& (Keroloth_HasPayed == FALSE)
 		&& (hero.guild != GIL_KDF)
 		{
				return TRUE;
		};
};

func void DIA_Keroloth_KAP4_BELOHNUNG_Info ()
{
 	AI_Output			(other, self, "DIA_Keroloth_KAP4_BELOHNUNG_15_00"); //Chci nálezné za tvùj mêšec.

	if ((Keroloths_BeutelLeer == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_BELOHNUNG_07_01"); //Dostaneš akorát tak ránu do zubù!
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_BELOHNUNG_07_02"); //To je jediné, co tê zajímá? Tady máš sakra pár zlatých a teë zmiz.
		
		CreateInvItems (self, ItMi_Gold, 50);									
		B_GiveInvItems (self, other, ItMi_Gold, 50);					
		
		Keroloth_HasPayed = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info entspanndich
///////////////////////////////////////////////////////////////////////
instance DIA_Keroloth_KAP4_ENTSPANNDICH		(C_INFO)
{
	npc		 = 	PAL_258_Keroloth;
	nr		 = 	44;
	condition	 = 	DIA_Keroloth_KAP4_ENTSPANNDICH_Condition;
	information	 = 	DIA_Keroloth_KAP4_ENTSPANNDICH_Info;
	permanent	 = 	TRUE;

	description	 = 	"Klídek.";
};

func int DIA_Keroloth_KAP4_ENTSPANNDICH_Condition ()
{
	if ((Npc_KnowsInfo(other, DIA_Keroloth_KAP4_GELDGEFUNDEN))
		&& (Kapitel >= 4))
		|| (MIS_OCGateOpen == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Keroloth_KAP4_ENTSPANNDICH_Info ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_ENTSPANNDICH_15_00"); //Klídek.
	
	if (hero.guild == GIL_KDF)
	{
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_01"); //Ano, mistâe. Pokusím se.
	}
	else if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_02"); //Nemùžu to dokázat, ale myslím, že ty jsi ten zrádce, který otevâel bránu.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_03"); //Za to teë zaplatíš.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);	
	}
	else 
	{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_ENTSPANNDICH_15_04"); //Máš svùj mêšec zpátky, ne?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_05"); //Nehraj si se mnou, chlapèe! Padej!
	AI_StopProcessInfos (self);
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Keroloth_KAP5_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_KAP5_EXIT_Condition;
	information	= DIA_Keroloth_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Keroloth_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Keroloth_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Keroloth_KAP6_EXIT(C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 999;
	condition	= DIA_Keroloth_KAP6_EXIT_Condition;
	information	= DIA_Keroloth_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Keroloth_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Keroloth_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Keroloth_PICKPOCKET (C_INFO)
{
	npc			= PAL_258_Keroloth;
	nr			= 900;
	condition	= DIA_Keroloth_PICKPOCKET_Condition;
	information	= DIA_Keroloth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Keroloth_PICKPOCKET_Condition()
{
	C_Beklauen (25, 45);
};
 
FUNC VOID DIA_Keroloth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Keroloth_PICKPOCKET);
	Info_AddChoice		(DIA_Keroloth_PICKPOCKET, DIALOG_BACK 		,DIA_Keroloth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Keroloth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Keroloth_PICKPOCKET_DoIt);
};

func void DIA_Keroloth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Keroloth_PICKPOCKET);
};
	
func void DIA_Keroloth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Keroloth_PICKPOCKET);
};




















































