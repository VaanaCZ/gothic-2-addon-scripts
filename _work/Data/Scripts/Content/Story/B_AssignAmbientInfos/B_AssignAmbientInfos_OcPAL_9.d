// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_OCPAL_9_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_OCPAL_9_EXIT_Condition;
	information	= DIA_OCPAL_9_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_OCPAL_9_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_OCPAL_9_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_OCPAL_9_PEOPLE_Condition;
	information	= DIA_OCPAL_9_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_OCPAL_9_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_9_PEOPLE_15_00"); //Qui commande ici ?
	AI_Output (self, other, "DIA_OCPAL_9_PEOPLE_09_01"); //Garond est le commandant du ch�teau. On ne peut pas vraiment lui envier son poste.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_OCPAL_9_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_OCPAL_9_LOCATION_Condition;
	information	= DIA_OCPAL_9_LOCATION_Info;
	permanent	= TRUE;
	description = "Que savez-vous au sujet de cette vall�e ?";
};                       

FUNC INT DIA_OCPAL_9_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_9_LOCATION_15_00"); //Que savez-vous au sujet de cette vall�e ?
	AI_Output (self, other, "DIA_OCPAL_9_LOCATION_09_01"); //A l'est, les orques ont �rig� une gigantesque enceinte, certainement pour prot�ger leur ravitaillement. Derri�re le mur, des docks peuvent accueillir leurs navires.
	AI_Output (self, other, "DIA_OCPAL_9_LOCATION_09_02"); //J'esp�re que les orques ne seront pas ravitaill�s trop rapidement. Je trouve que ce que nous devons affronter pour l'instant est largement suffisant.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_OCPAL_9_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_OCPAL_9_STANDARD_Condition;
	information	= DIA_OCPAL_9_STANDARD_Info;
	permanent	= TRUE;
	description = "Comment �a se passe ?";
};
                       
func INT DIA_OCPAL_9_STANDARD_Condition()
{
	return TRUE;
};

FUNC VOID DIA_OCPAL_9_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_OCPAL_4_STANDARD_15_00"); //Comment �a se passe ?
		
	if (Kapitel <= 3)
	{
		AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_01"); //Les dragons nous ont encore attaqu�s ! Mais Innos nous prot�gera. Les cr�atures de B�liar le paieront de leur sang !
	};

	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_02"); //Des chasseurs de dragons ! Ils auraient d� nous envoyer des paladins !
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_03"); //Maintenant que nous sommes d�barrass�s de ces dragons, on peut s'occuper des orques !
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_04"); //Nous devons charger le minerai sur le navire et quitter cette terre maudite.
		}
		else
		{
			AI_Output (self,other,"DIA_OCPAL_4_STANDARD_09_05"); //Trahison ! La porte n'aurait jamais d� s'ouvrir. Mort aux tra�tres !
		};
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_OCPAL_9 (var c_NPC slf)
{
	DIA_OCPAL_9_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_OCPAL_9_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_OCPAL_9_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_OCPAL_9_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
