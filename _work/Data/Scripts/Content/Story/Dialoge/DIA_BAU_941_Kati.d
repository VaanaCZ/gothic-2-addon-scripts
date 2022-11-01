///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kati_EXIT   (C_INFO)
{
	npc         = BAU_941_Kati;
	nr          = 999;
	condition   = DIA_Kati_EXIT_Condition;
	information = DIA_Kati_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kati_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Kati_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info SLDnochda
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_SLDNOCHDA		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	4;
	condition	 = 	DIA_Kati_SLDNOCHDA_Condition;
	information	 = 	DIA_Kati_SLDNOCHDA_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Kati_SLDNOCHDA_Condition ()
{
	if  !(Npc_IsDead (Alvares))
	&&  !(Npc_IsDead (Engardo))	
	&&  (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Kati_SLDNOCHDA_Info ()
{
	//--------------------------------------
	var int Hilfe;
	//--------------------------------------
	
	if (Hilfe == FALSE)
	{
		AI_Output (self, other, "DIA_Kati_SLDNOCHDA_16_00"); //Ces coupeurs de gorges menacent mon mari ! Nous sommes citoyens de la ville, loyaux sujets du roi et les mercenaires veulent nous voler !
		Hilfe = TRUE;
	};
	AI_Output (self, other, "DIA_Kati_SLDNOCHDA_16_01"); //Que faites-vous planté là ! Faites quelque chose ! Aidez-nous !
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"La ferme d'Akil est menacée par des mercenaires."); 

	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_HALLO		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	5;
	condition	 = 	DIA_Kati_HALLO_Condition;
	information	 = 	DIA_Kati_HALLO_Info;
	permanent 	 =  FALSE;
	description	 = 	"Allez-vous bien ?";
};

func int DIA_Kati_HALLO_Condition ()
{	
	if (Npc_IsDead (Alvares))
	&& (Npc_IsDead (Engardo))
	{
		return TRUE;
	};
};
func void DIA_Kati_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Kati_HALLO_15_00"); //Vous allez bien ?
	
	if (Npc_IsDead (Akil))
	{
		AI_Output (self, other, "DIA_Kati_HALLO_16_01"); //(sanglots) Mon bien-aimé mari est mort ! Oh ! Innos ! Pourquoi me punir aussi durement ?
		
		Npc_ExchangeRoutine	(self,"Start");
		B_StartOtherRoutine	(Randolph,"Start");

		B_GivePlayerXP (XP_Akil_Tot);	
	}
	else
	{
		AI_Output (self, other, "DIA_Kati_HALLO_16_02"); //Oui, je vais bien, merci.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Essen
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_ESSEN		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	12;
	condition	 = 	DIA_Kati_ESSEN_Condition;
	information	 = 	DIA_Kati_ESSEN_Info;
	permanent 	 =  FALSE;
	description	 = 	"Akil dit que vous pouvez m'offrir un repas.";
};

func int DIA_Kati_ESSEN_Condition ()
{
	if (Kati_Mahlzeit == TRUE)
	&& ((Npc_IsDead(Akil))== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kati_ESSEN_Info ()
{
	AI_Output (other, self, "DIA_Kati_ESSEN_15_00"); //Akil m'a dit que vous auriez un repas pour moi.
	AI_Output (self, other, "DIA_Kati_ESSEN_16_01"); //Les temps sont durs depuis que la Barrière est tombée et la région n'est plus sûre.
	AI_Output (self, other, "DIA_Kati_ESSEN_16_02"); //Voici un peu de pain, de la viande et de l'eau. C'est tout ce que je peux vous offrir.
	
	B_GiveInvItems (self, other, ItFo_Bread, 1);			
	B_GiveInvItems (self, other, ItFo_Water, 1);			
	B_GiveInvItems (self, other, ItFoMutton, 1);			

};

///////////////////////////////////////////////////////////////////////
//	Info Akil ist tot Kati ist der Ersatz 
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_Baltram		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	4;
	condition	 = 	DIA_Kati_Baltram_Condition;
	information	 = 	DIA_Kati_Baltram_Info;
	permanent	 = 	FALSE;
	description	 = "Je suis envoyé par Baltram...";
};
func int DIA_Kati_Baltram_Condition ()
{
	if  (Npc_IsDead (Akil))
	&&  (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	&&  (Lieferung_Geholt == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kati_Baltram_Info ()
{
	AI_Output (other, self, "DIA_Kati_Baltram_15_00"); //Baltram m'envoie. Je dois récupérer une livraison pour lui.
	AI_Output (self, other, "DIA_Kati_Baltram_16_01"); //Oui, naturellement. Tenez, j'ai tout préparé.
	CreateInvItems 	(self, ItMi_BaltramPaket, 1 );
	B_GiveInvItems (self, other, ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
};
	
///////////////////////////////////////////////////////////////////////
//	Info Bauernaufstand
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_BAUERNAUFSTAND		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	6;
	condition	 = 	DIA_Kati_BAUERNAUFSTAND_Condition;
	information	 = 	DIA_Kati_BAUERNAUFSTAND_Info;
	permanent    =  FALSE;
	description	 = 	"Pourquoi ne pas vous défendre contre la tyrannie d'Onar ?";
};

func int DIA_Kati_BAUERNAUFSTAND_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Kati_BAUERNAUFSTAND_Info ()
{
	AI_Output (other, self, "DIA_Kati_BAUERNAUFSTAND_15_00"); //Pourquoi ne pas vous défendre contre la tyrannie d'Onar ?
	AI_Output (self, other, "DIA_Kati_BAUERNAUFSTAND_16_01"); //Pour nous les fermiers proches de la ville, il est plus important de rester en bonne intelligence avec la milice plutôt que de se fier aux mercenaires d'Onar.
	AI_Output (self, other, "DIA_Kati_BAUERNAUFSTAND_16_02"); //D'un autre coté, Bengar et Sékob préféreraient perdre leurs fermes plutôt que de travailler pour le roi.

};

///////////////////////////////////////////////////////////////////////
//	Info AndereHoefe
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_ANDEREHOEFE		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	7;
	condition	 = 	DIA_Kati_ANDEREHOEFE_Condition;
	information	 = 	DIA_Kati_ANDEREHOEFE_Info;
	permanent	 =  FALSE;
	description	 = 	"Où puis-je trouver les fermes de Bengar et de Sékob ?";
};

func int DIA_Kati_ANDEREHOEFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_ANDEREHOEFE_Info ()
{
	AI_Output (other, self, "DIA_Kati_ANDEREHOEFE_15_00"); //Où puis-je trouver les fermes de Bengar et de Sékob ?
	AI_Output (self, other, "DIA_Kati_ANDEREHOEFE_16_01"); //Elles ne sont pas loin de celle du propriétaire terrien. Allez vers l'est et vous les trouverez.
};

///////////////////////////////////////////////////////////////////////
//	Info HierWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_HIERWEG		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	9;
	condition	 = 	DIA_Kati_HIERWEG_Condition;
	information	 = 	DIA_Kati_HIERWEG_Info;
	permanent	 =  FALSE;
	description	 = 	"N'avez-vous jamais envisagé de partir d'ici ?";
};

func int DIA_Kati_HIERWEG_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_HIERWEG_Info ()
{
	AI_Output (other, self, "DIA_Kati_HIERWEG_15_00"); //N'avez-vous jamais songé à partir d'ici ?
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_01"); //Il n'est pas facile de partir de cette région entourée d'une haute chaîne de montagnes.
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_02"); //Les seuls moyens de partir d'ici sont le col vers la Vallée des mines et le port.
	AI_Output (self, other, "DIA_Kati_HIERWEG_16_03"); //Puisque nous ne pouvons nous offrir un passage sur un bateau et que la Vallée des mines est une destination sans retour, nous sommes obligés de rester ici.
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PASS		(C_INFO)
{
	npc		 	 = 	BAU_941_Kati;
	nr			 = 	10;
	condition	 = 	DIA_Kati_PASS_Condition;
	information	 = 	DIA_Kati_PASS_Info;
	permanent	 =  FALSE;
	description	 = 	"Que savez-vous au sujet du col ?";
};

func int DIA_Kati_PASS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kati_HIERWEG))
	{
		return TRUE;
	};
};

func void DIA_Kati_PASS_Info ()
{
	AI_Output (other, self, "DIA_Kati_PASS_15_00"); //Que savez-vous au sujet du col ?
	AI_Output (self, other, "DIA_Kati_PASS_16_01"); //Je n'y suis jamais allée moi-même. Mais il doit se trouver quelque part près de la ferme de Bengar, sur les hauts pâturages.
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PERMKAP1		(C_INFO)
{
	npc			 = 	BAU_941_Kati;
	nr			 = 	11;
	condition	 = 	DIA_Kati_PERMKAP1_Condition;
	information	 = 	DIA_Kati_PERMKAP1_Info;
	permanent	 = 	TRUE;
	description	 = 	"Prenez soin de votre mari.";
};

func int DIA_Kati_PERMKAP1_Condition ()
{
	if 	(
		(!C_NpcIsDown (Akil))
		&& (Npc_KnowsInfo(other, DIA_KATI_HALLO))
		&& (Npc_KnowsInfo(other, DIA_KATI_BAUERNAUFSTAND))
		&& (Npc_KnowsInfo(other, DIA_KATI_ANDEREHOEFE))
		&& (Npc_KnowsInfo(other, DIA_KATI_HIERWEG))
		&& (Npc_KnowsInfo(other, DIA_KATI_PASS))
		&& (Kapitel < 3)
		)
			{
					return TRUE;
			};
};

func void DIA_Kati_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Kati_PERMKAP1_15_00"); //Veillez sur votre mari.
	AI_Output			(self, other, "DIA_Kati_PERMKAP1_16_01"); //Je ferai de mon mieux.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Kati_KAP3_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP3_EXIT_Condition;
	information	= DIA_Kati_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PERM		(C_INFO)
{
	npc		 = 	BAU_941_Kati;
	nr		 = 	3;
	condition	 = 	DIA_Kati_PERM_Condition;
	information	 = 	DIA_Kati_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vous vous en sortez toujours ?";
};

func int DIA_Kati_PERM_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Kati_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Kati_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Kati_PERM_15_00"); //Vous vous en sortez toujours ?
	AI_Output			(self, other, "DIA_Kati_PERM_16_01"); //On se débrouille. Je me demande juste combien de temps nous allons devoir subir ces diables en noir.
	AI_Output			(self, other, "DIA_Kati_PERM_16_02"); //Je ne peux plus les supporter. Ils traînent autour de la maison et font des bruits étranges.
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

INSTANCE DIA_Kati_KAP4_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP4_EXIT_Condition;
	information	= DIA_Kati_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Kati_KAP5_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP5_EXIT_Condition;
	information	= DIA_Kati_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP5_EXIT_Info()
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


INSTANCE DIA_Kati_KAP6_EXIT(C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 999;
	condition	= DIA_Kati_KAP6_EXIT_Condition;
	information	= DIA_Kati_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Kati_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kati_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kati_PICKPOCKET (C_INFO)
{
	npc			= BAU_941_Kati;
	nr			= 900;
	condition	= DIA_Kati_PICKPOCKET_Condition;
	information	= DIA_Kati_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Kati_PICKPOCKET_Condition()
{
	C_Beklauen (13, 15);
};
 
FUNC VOID DIA_Kati_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kati_PICKPOCKET);
	Info_AddChoice		(DIA_Kati_PICKPOCKET, DIALOG_BACK 		,DIA_Kati_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kati_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kati_PICKPOCKET_DoIt);
};

func void DIA_Kati_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kati_PICKPOCKET);
};
	
func void DIA_Kati_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kati_PICKPOCKET);
};






























