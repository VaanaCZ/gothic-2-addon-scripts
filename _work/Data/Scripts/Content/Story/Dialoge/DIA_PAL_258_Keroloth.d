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
	AI_Output	(other ,self,"DIA_Keroloth_HELLO_15_00"); //Sei tu che alleni la gente?
	AI_Output	(self ,other,"DIA_Keroloth_HELLO_07_01"); //Sì. Quando gli orchi o, peggio ancora, i draghi attaccheranno di nuovo, avremo bisogno di ogni singolo combattente.
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
	description = "Puoi addestrare anche me?";
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
	AI_Output 	(other,self ,"DIA_Keroloth_WantTeach_15_00"); //Puoi addestrare anche me?
	AI_Output 	(self ,other,"DIA_Keroloth_WantTeach_07_01"); //Certo. Allenerò ogni uomo capace.
	AI_Output 	(self ,other,"DIA_Keroloth_WantTeach_07_02"); //Ma a parte il talento, ti servirà una buona arma se vorrai sopravvivere qui.
	AI_Output 	(self ,other,"DIA_Keroloth_WantTeach_07_03"); //Chiedi al cavaliere Tandor. Si occuperà di te.
		
	Keroloth_TeachPlayer = TRUE;
	Log_CreateTopic (TOPIC_Teacher_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Teacher_OC,"Keroloth allena i guerrieri nel castello.");
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Tandor commercia in armi al castello.");
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
	description = "(Apprendi il combattimento a una mano)";
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
	AI_Output 	(other,self ,"DIA_Keroloth_Teacher_15_00"); //Voglio allenarmi!
	
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
	AI_Output(self,other,"B_Keroloth_TeachNoMore1_07_00"); //Sei molto abile. Non c'è niente che io possa insegnarti.
};

FUNC VOID B_Keroloth_TeachNoMore2 ()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore2_07_00"); //Solo un maestro di spada ben allenato potrà aiutarti ormai.
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
	description = "(Apprendi il combattimento a due mani)";
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
	AI_Output (other,self ,"DIA_Keroloth_Teach_15_00"); //Iniziamo.
	
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
	description = "E i combattimenti a distanza?";
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
	AI_Output 	(other,self ,"DIA_Keroloth_Udar_15_00"); //E i combattimenti a distanza?
	AI_Output	(self ,other,"DIA_Keroloth_Udar_07_01"); //Cosa vuoi sapere?
	AI_Output 	(other,self ,"DIA_Keroloth_Udar_15_02"); //Puoi insegnarmi anche quello?
	AI_Output	(self ,other,"DIA_Keroloth_Udar_07_03"); //No, ma puoi chiedere e Udar, è un bravo... no, è il MIGLIORE balestriere che io conosca.
	
	
	Log_CreateTopic	(TOPIC_Teacher_OC, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher_OC, "Udar, nel castello della Valle delle Miniere, conosce ogni segreto delle balestre.");
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

	description	 = 	"Come la metti giù dura.";
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
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_15_00"); //Come la metti giù dura.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_07_01"); //(agitato) Maledizione. Te lo dico io, devi sempre essere vigile come un falco.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_07_02"); //Se volti le spalle anche solo per un momento, tutte le tue cose saranno sparite. Sporca feccia!

	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, DIALOG_BACK, DIA_Keroloth_KAP4_HELLO_ende );
	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Un paladino non dovrebbe arrabbiarsi tanto.", DIA_Keroloth_KAP4_HELLO_ruhig );
 	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Sei stato derubato?", DIA_Keroloth_KAP4_HELLO_bestohlen );
	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Quale vagabondo?", DIA_Keroloth_KAP4_HELLO_pack );


};
func void DIA_Keroloth_KAP4_HELLO_ende ()
{
	Info_ClearChoices	(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_bestohlen ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_15_00"); //Sei stato derubato?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_07_01"); //No. Mi hanno infilato in tasca 20 pezzi d'oro di nascosto. Certo che mi hanno rubato qualcosa, idiota!
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_07_02"); //Giuro, appena metterò le mani sulla sporca canaglia...

	Info_AddChoice	(DIA_Keroloth_KAP4_HELLO, "Cosa ti è stato sottratto?", DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt );
};
func void DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00"); //Cosa ti è stato sottratto?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01"); //Il mio borsellino, con dentro tutti i miei risparmi.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02"); //E ora è sparito!
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03"); //Spunterà fuori prima o poi.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04"); //Quando metterò le mani sul ladro...

	Log_CreateTopic (TOPIC_KerolothsGeldbeutel, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KerolothsGeldbeutel, LOG_RUNNING);
	B_LogEntry (TOPIC_KerolothsGeldbeutel,"Il paladino Keroloth ha perso la sua borsa. Dice che i cacciatori di draghi gliel'hanno rubata."); 


	Info_ClearChoices	(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_pack ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_pack_15_00"); //Quale vagabondo?
	
	if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_01"); //I tuoi squallidi cacciatori di draghi, naturalmente. Chi altro?
		}
	else
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_02"); //Quella marmaglia di cacciatori di draghi, naturalmente. Di chi pensavi stessi parlando?
		};
		
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_pack_07_03"); //(tra se) Devi sempre stare all'erta, te lo dico io.
};

func void DIA_Keroloth_KAP4_HELLO_ruhig ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_HELLO_ruhig_15_00"); //Calmati! Un paladino non dovrebbe perdere la calma in questo modo.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_HELLO_ruhig_07_01"); //Ma io non voglio calmarmi. Era tutto quello che avevo, dannazione!
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

	description	 = 	"Credo di aver trovato la tua borsa.";
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
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00"); //Credo di aver trovato la tua borsa.
	TOPIC_END_KerolothsGeldbeutel = TRUE;
	B_GivePlayerXP (XP_KerolothsGeldbeutel);
	if (B_GiveInvItems (other, self, ItMi_KerolothsGeldbeutelLeer_MIS,1))
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01"); //La borsa è vuota. Quale porco è stato?
	
		Keroloths_BeutelLeer = TRUE;
	};
	if (B_GiveInvItems (other, self, ItMi_KerolothsGeldbeutel_MIS,1))
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02"); //Cosa? Dove? Quale bastardo è stato?
	};
	
	if (hero.guild == GIL_DJG)
	{
		Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Aspetta un attimo. E la ricompensa?", DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn );
	};

	Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Era laggiù, vicino alla bottega del drago.", DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede );
	Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Sospetto che sia opera di uno dei cacciatori di draghi.", DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG );
	Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Come faccio a saperlo?", DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung);
};
func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00"); //Come faccio a saperlo?

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01"); //Vuoi prendermi in giro? Sei stato tu, ammettilo.
		
		Info_ClearChoices	(DIA_Keroloth_KAP4_GELDGEFUNDEN);
		Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Sospetto che sia opera di uno dei cacciatori di draghi.", DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG );
		Info_AddChoice	(DIA_Keroloth_KAP4_GELDGEFUNDEN, "Vai al diavolo.", DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich );
	}
	else
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02"); //Lo scoprirò comunque, prima o poi.
		AI_StopProcessInfos (self);
	};
};
func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_kannstmich_15_00"); //Vai al diavolo.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_kannstmich_07_01"); //Ti insegnerò io cosa succede a rubare dalla gente onesta.

	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00"); //Sospetto che sia opera di uno dei cacciatori di draghi.
		
	AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01"); //(infuriato) Lo sapevo.
	
	if (hero.guild == GIL_DJG)
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02"); //(gridando) Non avrebbero mai dovuto farli entrare nel castello.
		}
		else
		{
			AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_03"); //Aspetta e vedrai, darò a quei porci quello che meritano.
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
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00"); //Ehm. Era laggiù, vicino alla bottega del drago.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01"); //Dove? Vicino alla fucina? Dev'essere caduta dalla tasca di qualche Cacciatore di Draghi, non dirmi di no.
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn ()
{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00"); //Aspetta un attimo. E la ricompensa?
	
 	if (Keroloths_BeutelLeer == TRUE)
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01"); //Questo è il colmo. È da un po' che non ricevi un bel pugno, eh?
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02"); //Argh, d'accordo. Eccoti un po' di monete. E ora dimmi, chi è stato?
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

	description	 = 	"Voglio la ricompensa che mi spetta per aver trovato la tua borsa.";
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
 	AI_Output			(other, self, "DIA_Keroloth_KAP4_BELOHNUNG_15_00"); //Voglio la ricompensa che mi spetta per aver trovato la tua borsa.

	if ((Keroloths_BeutelLeer == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_BELOHNUNG_07_01"); //Puoi avere un pugno in faccia se vuoi!
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output			(self, other, "DIA_Keroloth_KAP4_BELOHNUNG_07_02"); //È questa la tua unica preoccupazione? Eccoti qualche maledetta moneta, e ora sparisci.
		
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

	description	 = 	"Rilassati.";
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
	AI_Output			(other, self, "DIA_Keroloth_KAP4_ENTSPANNDICH_15_00"); //Rilassati.
	
	if (hero.guild == GIL_KDF)
	{
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_01"); //Sì, maestro, ci proverò.
	}
	else if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_02"); //Non posso provarlo, ma credo che tu sia il traditore che ha aperto il cancello.
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_03"); //Ora la pagherai.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);	
	}
	else 
	{
	AI_Output			(other, self, "DIA_Keroloth_KAP4_ENTSPANNDICH_15_04"); //Hai riavuto indietro il tuo borsellino, non è vero?
	AI_Output			(self, other, "DIA_Keroloth_KAP4_ENTSPANNDICH_07_05"); //Non mi provocare, ragazzo! Sparisci!
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




















































