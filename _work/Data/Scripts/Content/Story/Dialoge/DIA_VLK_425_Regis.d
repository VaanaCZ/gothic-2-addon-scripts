///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Regis_EXIT   (C_INFO)
{
	npc         = VLK_425_Regis;
	nr          = 999;
	condition   = DIA_Regis_EXIT_Condition;
	information = DIA_Regis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Regis_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Regis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Regis_PICKPOCKET (C_INFO)
{
	npc			= VLK_425_Regis;
	nr			= 900;
	condition	= DIA_Regis_PICKPOCKET_Condition;
	information	= DIA_Regis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Regis_PICKPOCKET_Condition()
{
	C_Beklauen (40, 35);
};
 
FUNC VOID DIA_Regis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Regis_PICKPOCKET);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_BACK 		,DIA_Regis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Regis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Regis_PICKPOCKET_DoIt);
};

func void DIA_Regis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
	
func void DIA_Regis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Regis_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Hallo		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	1;
	condition	 = 	DIA_Regis_Hallo_Condition;
	information	 = 	DIA_Regis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Regis_Hallo_Condition ()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Regis_Hallo_Info ()
{	
	AI_Output			(self, other, "DIA_Regis_Hallo_13_00"); //H�! Vous �tes nouveau en ville, non�?
	AI_Output			(other, self, "DIA_Regis_Hallo_15_01"); //Oui, et vous�?
	AI_Output			(self, other, "DIA_Regis_Hallo_13_02"); //Je viens du continent et je n'ai pas grand-chose � faire ici. Je suis presque � court d'or. Alors je crois bien qu'il va me falloir rejoindre la milice.
	AI_Output			(self, other, "DIA_Regis_Hallo_13_03"); //Mais je n'en ai pas envie. Il est hors de question que je me fasse massacrer par les orques pour le bon plaisir du roi.
};
///////////////////////////////////////////////////////////////////////
//	Info MILIZ
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_MILIZ		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_MILIZ_Condition;
	information	 = 	DIA_Regis_MILIZ_Info;
	permanent    =  FALSE;
	description	 = 	"Que pouvez-vous me dire au sujet de la milice ?";
};
func int DIA_Regis_MILIZ_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_Hallo) 
	{
		return TRUE;
	};
};
func void DIA_Regis_MILIZ_Info ()
{
	AI_Output (other, self, "DIA_Regis_MILIZ_15_00"); //Que pouvez-vous me dire au sujet de la milice�?
	AI_Output (self, other, "DIA_Regis_Add_13_01"); //C'est un paladin qui en a pris la t�te, un certain seigneur Andr�.
	AI_Output (self, other, "DIA_Regis_Add_13_02"); //Il est en train d'essayer de mobiliser la moiti� de la ville, des fois que les orques attaquent.
	AI_Output (self, other, "DIA_Regis_Add_13_03"); //Mais il faut �tre citoyen pour pouvoir int�grer la milice.
	AI_Output (self, other, "DIA_Regis_Add_13_04"); //Pour autant que je sache, quand on n'est pas citoyen, on peut s'entra�ner avec les autres, mais impossible de faire partie de la milice.
};
///////////////////////////////////////////////////////////////////////
//	Info ANDRE
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_ANDRE		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ANDRE_Condition;
	information	 = 	DIA_Regis_ANDRE_Info;
	permanent    =  FALSE;
	description	 = 	"Que pouvez-vous me dire d'autre au sujet du seigneur Andr� ?";
};
func int DIA_Regis_ANDRE_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_MILIZ) 
	{
		return TRUE;
	};
};
func void DIA_Regis_ANDRE_Info ()
{
	AI_Output (other, self, "DIA_Regis_ANDRE_15_00"); //Que pouvez-vous me dire d'autre au sujet du seigneur Andr�?
	AI_Output (self, other, "DIA_Regis_Add_13_05"); //C'est �galement lui qui assume d�sormais la fonction de juge.
	AI_Output (self, other, "DIA_Regis_Add_13_06"); //Si vous causez des ennuis en ville, c'est devant lui que vous devrez en r�pondre.
	AI_Output (self, other, "DIA_Regis_Add_13_07"); //Un jour, je me suis battu � coups de poings contre un citoyen.
	AI_Output (self, other, "DIA_Regis_Add_13_08"); //Apr�s coup, ce d�gonfl� est all� pleurer aupr�s du seigneur Andr�.
	AI_Output (self, other, "DIA_Regis_Add_13_09"); //Cette petite plaisanterie m'a co�t� 50 pi�ces d'or.
	AI_Output (self, other, "DIA_Regis_Add_13_10"); //Et encore, heureusement que cela c'�tait produit de nuit, sans quoi il y aurait eu d'autres t�moins.
	AI_Output (self, other, "DIA_Regis_Add_13_11"); //Et ici, plus vous avez de gens qui se plaignent de votre comportement, plus l'amende qu'on vous inflige est �lev�e.
};

// ****************************************************
// 					Pr�gelei mit Valentino
// ****************************************************
instance DIA_Regis_Valentino (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_Valentino_Condition;
	information	 = 	DIA_Regis_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"Avec qui vous �tes-vous battu ?";
};
func int DIA_Regis_Valentino_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Regis_ANDRE) 
	{
		return TRUE;
	};
};
func void DIA_Regis_Valentino_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_12"); //Contre qui vous �tes-vous battu�?
	AI_Output (self, other, "DIA_Regis_Add_13_13"); //Un certain Valentino. Il tra�ne souvent dans le pub proche du temple.
	AI_Output (self, other, "DIA_Regis_Add_13_14"); //Je ne suis pas du genre violent pourtant, mais ce type avait grand besoin qu'on lui refasse le portrait.
};

// ****************************************************
// 					Valentino DEFEATED
// ****************************************************
instance DIA_Regis_ValDefeat (C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	5;
	condition	 = 	DIA_Regis_ValDefeat_Condition;
	information	 = 	DIA_Regis_ValDefeat_Info;
	permanent    =  FALSE;
	description	 = 	"J'ai rencontr� Valentino...";
};
func int DIA_Regis_ValDefeat_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Regis_Valentino))
	&& (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_ValDefeat_Info ()
{
	AI_Output (other, self, "DIA_Regis_Add_15_15"); //J'ai fait la connaissance de Valentino.
	AI_Output (self, other, "DIA_Regis_Add_13_16"); //Et ?
	AI_Output (other, self, "DIA_Regis_Add_15_17"); //Je lui ai mis une bonne racl�e.
	AI_Output (self, other, "DIA_Regis_Add_13_18"); //(�clate de rire) C'est tout ce qu'il m�rite�!
	if (!Npc_IsDead (Valentino))
	{
		AI_Output (self, other, "DIA_Regis_Add_13_19"); //Tenez, j'ai trouv� cet anneau sur lui le jour o� nous avons r�gl� notre petit diff�rend.
		B_GiveInvItems (self, other, ItRi_ValentinosRing, 1);
		Regis_Ring = TRUE;
		AI_Output (self, other, "DIA_Regis_Add_13_20"); //(sourit) N'h�sitez pas � le remettre � la prochaine personnage qui le tabassera.
	};
};

// **************************************************************
// 							PERM
// **************************************************************
//--------------------------
	var int Regis_Bogendieb;
//--------------------------
instance DIA_Regis_PERM		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr 			 =  200;
	condition	 = 	DIA_Regis_PERM_Condition;
	information	 = 	DIA_Regis_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Il s'est pass� quelque chose d'int�ressant ?";
};
func int DIA_Regis_PERM_Condition ()
{
	return TRUE;
};
func void DIA_Regis_PERM_Info ()
{
	AI_Output (other, self, "DIA_Regis_PERM_15_00"); //Il s'est pass� quelque chose de notable derni�rement�?
	
	if (Regis_Bogendieb == FALSE)
	&& (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_01"); //On pourrait dire �a comme �a...
		AI_Output (self, other, "DIA_Regis_PERM_13_02"); //Bosper, le fabricant d'arcs, a �t� vol�. Quelle audace, vous vous rendez compte�?
		AI_Output (self, other, "DIA_Regis_PERM_13_03"); //Le voleur est entr� dans sa boutique en plein jour pour en ressortir avec un de ses arcs.
		AI_Output (self, other, "DIA_Regis_PERM_13_04"); //Bosper lui a couru apr�s en criant�: 'Au voleur�!' Mais l'autre �tait trop rapide.
		
		
		MIS_Bosper_Bogen = LOG_RUNNING;
		Regis_Bogendieb = TRUE;
	}
	else if (MIS_Bosper_Bogen == LOG_SUCCESS)
		 && (Regis_Bogendieb != 2)	
	{
		AI_Output (self, other, "DIA_Regis_PERM_13_05"); //Et puis, un illustre inconnu a ramen� l'arc vol� � Bosper.
		AI_Output (self, other, "DIA_Regis_PERM_13_06"); //Incroyable non�? Pourtant, on pourrait croire que c'est chacun pour soi en ce moment, mais non, cet homme a quand m�me ramen� l'arc.
		Regis_Bogendieb = 2;
	}
	else
	{
		if (Kapitel != 3)
		{
			AI_Output (self, other, "DIA_Regis_PERM_13_07"); //Tout est calme. Mais je suppose que, quand les orques arriveront, tout le monde s'en rendra compte...
		}
		else 
		{
			if (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_08"); //J'ai appris que le mercenaire �tait innocent et qu'il avait �t� lib�r�.
				AI_Output (self, other, "DIA_Regis_PERM_13_09"); //Le seigneur Hagen doit �tre fou de rage.
			}
			else
			{
				AI_Output (self, other, "DIA_Regis_PERM_13_10"); //La ville enti�re ne parle plus que de �a. Vous vous souvenez de Lothar, le paladin�?
				AI_Output (other,self , "DIA_Regis_PERM_15_11"); //Peut-�tre.
				AI_Output (self, other, "DIA_Regis_PERM_13_12"); //Eh bien il est mort, assassin� en pleine rue. Et on dit que c'est la faute des mercenaires bien s�r.
			};
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
instance DIA_Regis_Crew		(C_INFO)
{
	npc			 = 	VLK_425_Regis;
	nr			 = 	51;
	condition	 = 	DIA_Regis_Crew_Condition;
	information	 = 	DIA_Regis_Crew_Info;
	permanent    =  FALSE;
	description	 = 	"Je cherche � constituer un �quipage pour un voyage en mer.";
};
func int DIA_Regis_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Regis_Crew_Info ()
{
	AI_Output			(other, self, "DIA_Regis_Crew_15_00"); //Je suis � la recherche d'un �quipage pour partir en mer.
	AI_Output			(self, other, "DIA_Regis_Crew_13_01"); //Je ne peux pas vous aider � ce sujet. Faites un tour au port ou peut-�tre au pub.
	AI_Output			(self, other, "DIA_Regis_Crew_13_02"); //S'il reste des marins en ville, c'est probablement l�-bas qu'on peut les trouver.

};


