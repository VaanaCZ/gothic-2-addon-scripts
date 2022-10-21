// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_7_EXIT_Condition;
	information	= DIA_SLD_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_7_JOIN_Condition;
	information	= DIA_SLD_7_JOIN_Info;
	permanent	= TRUE;
	description = "Je veux me joindre � vous !";
};                       

FUNC INT DIA_SLD_7_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_JOIN_15_00"); //Je veux me joindre � vous !
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_01"); //J'ai entendu dire que vous en aviez fait baver � la milice. On pourrait avoir besoin de quelqu'un comme vous ici !
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_02"); //Je ne pense pas que le fait d'encaisser le loyer des paysans soit tr�s difficile mais si Onar veut vous payer pour �a, je n'ai rien contre.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_03"); //Vous ? Une fois que Torlof vous fait passer le test, vous �tes fichu !
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_7_PEOPLE_Condition;
	information	= DIA_SLD_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Qui commande ici ?";
};                       

FUNC INT DIA_SLD_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_PEOPLE_15_00"); //Qui est le responsable ici ?
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_01"); //Lee est le patron. Torlof est son bras droit. La plupart des hommes lui sont fid�les car il �tait leur chef � la colonie.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_02"); //Et il y a Sylvio. Il est arriv� des montagnes avec ses hommes, apr�s l'arriv�e de Lee.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_03"); //Lui et les siens ne repr�sentent qu'une petite partie des mercenaires, mais ils s�ment un grand d�sordre. Ces gars-l� n'en font qu'� leur t�te.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_04"); //Et Sylvio est un sacr� vicelard alors faites attention � lui.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_7_LOCATION_Condition;
	information	= DIA_SLD_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Parlez-moi de la ferme.";
};                       

FUNC INT DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_LOCATION_15_00"); //Parlez-moi de la ferme.
	AI_Output (self, other, "DIA_SLD_7_LOCATION_07_01"); //Onar nous a engag�s pour prot�ger ses biens.
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_SLD_7_LOCATION_07_02"); //Alors ne songez m�me pas � voler quoi que ce soit ou � vous en prendre aux fermiers, sinon vous aurez affaire � nous, compris ?
	};
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_7_STANDARD_Condition;
	information	= DIA_SLD_7_STANDARD_Info;
	permanent	= TRUE;
	description = "Quoi de neuf ?";
};                       
func INT DIA_SLD_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_STANDARD_15_00"); //Quoi de neuf ?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_01"); //Depuis que vous nous avez rejoints, tout est tranquille � la ferme. Plus de milice.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_02"); //Pas grand-chose de notre c�t�. Mais demandez en ville, je crois bien qu'ils commencent � manquer de bouffe. (rires)
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_03"); //Des dragons dans la Vall�e des mines ! J'aimerais pas �tre � la place des paladins !
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_04"); //Je pense que le roi va botter les fesses du seigneur Hagen quand il reviendra les mains vides � cause des dragons.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_05"); //Vous autres les paladins ne pouvez-vous pas vous occuper des dragons ? Remarquez, il est vrai que le combat est un boulot d'homme...
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_06"); //C'est une bonne chose que vous avez faite pour Bennet. Sylvio est vert de rage. Il aurait pr�f�r� attaquer la ville et tout casser.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_07"); //Il essaie constamment de pousser Lee � la d�fensive et cette histoire avec Bennet �tait le pr�texte id�al.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_08"); //J'ignore pourquoi vous avez aid� Bennet mais, croyez-moi, cela vaut mieux pour la ville.
			};
		}
		else
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_09"); //Sale affaire que cette histoire avec Bennet. Peut-�tre devrions-nous �couter Sylvio et attaquer la ville.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_10"); //Qu'envisagez-vous de faire avec Bennet ? En fait, je ne veux pas vraiment le savoir, vous d�couvrirez bien assez t�t o� cela vous m�nera.
			};
		};		
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_11"); //Je croyais que vous alliez avec Sylvio dans la vall�e.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_12"); //Aucun de nous ne regretterait que Sylvio reste dans la vall�e. A TOUT JAMAIS !
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_13"); //C'�tait courageux de votre part de venir ici tout seul.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_14"); //Mais je m'en fiche tant que vous n'�tes pas l� pour percevoir des taxes.
		};
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_SLD_7_STANDARD_07_15"); //Mon gar�on, je n'en peux plus. Tous ces moutons, ces p�turages et ces arbres... Je veux partir d'ici.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_7 (var c_NPC slf)
{
	DIA_SLD_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
