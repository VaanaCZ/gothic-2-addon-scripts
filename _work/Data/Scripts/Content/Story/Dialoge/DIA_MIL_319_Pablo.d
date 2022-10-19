///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_EXIT   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 999;
	condition   = DIA_Pablo_EXIT_Condition;
	information = DIA_Pablo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pablo_PICKPOCKET (C_INFO)
{
	npc			= Mil_319_Pablo;
	nr			= 900;
	condition	= DIA_Pablo_PICKPOCKET_Condition;
	information	= DIA_Pablo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ce serait un jeu d'enfant de lui voler sa clef)";
};                       

FUNC INT DIA_Pablo_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_01) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Pablo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pablo_PICKPOCKET);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_BACK 		,DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pablo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Pablo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pablo_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info WANTED
///////////////////////////////////////////////////////////////////////
var int Pablo_belogen;
//--------------------

instance DIA_Pablo_WANTED		(C_INFO)
{
	npc			 = 	Mil_319_Pablo;
	nr			 = 	1;
	condition	 = 	DIA_Pablo_WANTED_Condition;
	information	 = 	DIA_Pablo_WANTED_Info;
	important	 = 	TRUE;
};
func int DIA_Pablo_WANTED_Condition ()
{
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		return TRUE;
	};	
};
func void DIA_Pablo_WANTED_Info ()
{
	AI_Output (self, other, "DIA_Pablo_WANTED_12_00"); //H�, vous�! Attendez�! Vous me rappelez quelqu'un.
	AI_Output (other, self, "DIA_Pablo_WANTED_15_01"); //Que voulez-vous ?
	AI_Output (self, other, "DIA_Pablo_WANTED_12_02"); //J'ai d�j� vu votre t�te quelque part... ah�! Oui...
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Pablo_WANTED_12_03"); //Tenez, nous avons trouv� ce portrait sur des brigands que nous avons attrap�s voici quelques jours. Il vous ressemble beaucoup.
	B_GiveInvItems (self, other, ItWr_Poster_MIS,1);
	AI_Output (self, other, "DIA_Pablo_WANTED_12_04"); //Apparemment, ces types vous cherchaient.
	
	
	Info_ClearChoices (DIA_Pablo_WANTED);
	
	Info_AddChoice  (DIA_Pablo_WANTED,"Non, vous devez vous tromper.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice 	(DIA_Pablo_WANTED,"Ouah ! Je n'y aurais jamais pens� tout seul.",DIA_Pablo_WANTED_IRONY);
};
FUNC VOID DIA_Pablo_WANTED_NOTHING()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_NOTHING_15_00"); //Non, vous devez vous tromper. Je n'ai aucun souci.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_01"); //Si vous le dites, l'�tranger.
	//AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_02"); //Aber wenn du Probleme hast - dann lass sie au�erhalb der Stadt. Wir haben hier schon genug Schwierigkeiten.
	AI_Output (self ,other,"DIA_Pablo_Add_12_00"); //Mais si c'est bien votre t�te, finalement, et si vous avez des ennuis, ne les amenez pas ici. Nous avons d�j� bien assez de probl�mes comme �a.
	AI_Output (self, other, "DIA_Pablo_WANTED_NOTHING_12_03"); //Et les �trangers qui nous am�nent leurs probl�mes ne restent jamais en ville longtemps. J'esp�re avoir �t� clair...
	Pablo_belogen = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Pablo_WANTED_IRONY()
{
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_00"); //�a alors�! Je n'y aurais jamais pens�!
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_01"); //Tr�s dr�le. Qu'est-ce que ces types vous voulaient�?
	//AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_02"); //Ich werde sie fragen, wenn ich sie sehe. Ihr habt doch die Kerle eingelocht, die den Wisch dabei hatten, oder?
	AI_Output (other, self,"DIA_Pablo_Add_15_01"); //Posez-leur directement la question. Vous devez les avoir jet�s en prison, j'imagine...
	AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_03"); //Non. Ils sont morts.
	AI_Output (other, self, "DIA_Pablo_WANTED_IRONY_15_04"); //Dans ce cas, nous n'aurons sans doute jamais la r�ponse � cette question...
	//AI_Output (self, other, "DIA_Pablo_WANTED_IRONY_12_05"); //Nun, wenn du in Schwierigkeiten steckst, dann sprich mal mit Lord Andre. Den Wisch kannst du behalten. Sch�nen Tag noch.
	AI_Output (self ,other,"DIA_Pablo_Add_12_02"); //Si vous avez des ennuis, adressez-vous au seigneur Andr�. Peut-�tre pourra-t-il vous aider. Vous le trouverez � la caserne.
	
	AI_StopProcessInfos (self);
};

// *************************************************************
// 							Banditen
// *************************************************************
INSTANCE DIA_Pablo_Banditen   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_Banditen_Condition;
	information = DIA_Pablo_Banditen_Info;
	permanent   = FALSE;
	description = "Que savez-vous au sujet des bandits ?";
};
FUNC INT DIA_Pablo_Banditen_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Banditen_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_03"); //Que savez-vous au sujet des brigands�?
	//AI_Output (other, self, "DIA_Pablo_Banditen_15_00"); //Was wei�t du �ber die Banditen, die vor der Stadt ihr Unwesen treiben?
	AI_Output (self ,other,"DIA_Pablo_Add_12_04"); //Ils sont tous originaires de cette satan�e colonie mini�re, mais plusieurs groupes se sont constitu�s.
	AI_Output (self ,other,"DIA_Pablo_Add_12_05"); //Certains ont d�cid� d'aller se planquer dans les montagnes, tandis que d'autres se sont acoquin�s avec Onar, le propri�taire terrien.
	AI_Output (self ,other,"DIA_Pablo_Add_12_06"); //Mais ce sont ceux qui op�rent en dehors de la ville qui nous posent le plus de probl�mes.
	AI_Output (self ,other,"DIA_Pablo_Add_12_07"); //C'est � cause d'eux que nos marchands n'osent plus quitter la ville.
};

// *************************************************************
// 							HakonBandits
// *************************************************************
INSTANCE DIA_Pablo_HakonBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 3;
	condition   = DIA_Pablo_HakonBandits_Condition;
	information = DIA_Pablo_HakonBandits_Info;
	permanent   = FALSE;
	description = "Que savez-vous au sujet des bandits qui ont d�trouss� le marchand Hakon ?";
};
FUNC INT DIA_Pablo_HakonBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Hakon_Miliz))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_HakonBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_20"); //Que savez-vous sur les brigands qui ont d�valis� Hakon le marchand�?
	AI_Output (self ,other,"DIA_Pablo_Add_12_21"); //Oh. Je pr�f�rerais oublier cette histoire...
	AI_Output (self ,other,"DIA_Pablo_Add_12_22"); //D'apr�s ce que nous savons, ils sont responsables de la plupart des attaques subies par les marchands.
	
	AI_Output (self, other, "DIA_Pablo_Banditen_12_01"); //Ces sales rats sont retourn�s dans leurs terriers et n'osent plus en ressortir.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_02"); //Un jour, nous avons r�ussi � les poursuivre, mais nous avons d� les laisser partir dans les bois proches de la ville.
	AI_Output (self, other, "DIA_Pablo_Banditen_12_03"); //Continuer de les suivre aurait �t� trop dangereux, en raison des nombreuses cr�atures qui r�dent l�-bas...
	
	B_LogEntry(TOPIC_HakonBanditen,"Les bandits qui ont vol� Hakon se cachent dans les bois pr�s de la ville." );
	
	if (Pablo_AndreMelden == FALSE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_23"); //Ah, autre chose...
		AI_Output (self, other, "DIA_Pablo_Banditen_12_04"); //Quelques marchandises vol�es ont �t� retrouv�es � Khorinis.
		AI_Output (other, self, "DIA_Pablo_Banditen_15_05"); //Cela signifie qu'ils savent comment faire entrer discr�tement les marchandises en ville pour les vendre.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_06"); //Nous les soup�onnons d'avoir un receleur en ville, mais nous n'avons pas encore r�ussi � l'attraper.
		AI_Output (self, other, "DIA_Pablo_Banditen_12_07"); //Si vous apprenez quoi que ce soit � ce sujet, sachez que le seigneur Andr� a mis � prix la t�te du receleur.
	
		B_LogEntry(TOPIC_HakonBanditen,"Les bandits sont sans doute de m�che avec un receleur en ville. Le seigneur Andr� a promis une r�compense pour la capture de ce receleur." );
	};
}; 

// *************************************************************
// 							MyBandits
// *************************************************************
INSTANCE DIA_Pablo_MyBandits   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 4;
	condition   = DIA_Pablo_MyBandits_Condition;
	information = DIA_Pablo_MyBandits_Info;
	permanent   = FALSE;
	description = "D'o� venaient les bandits qui avaient l'avis de recherche me concernant ?";
};
FUNC INT DIA_Pablo_MyBandits_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Pablo_Banditen))
	&& (Npc_KnowsInfo (other, DIA_Pablo_Wanted))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pablo_MyBandits_Info()
{
	AI_Output (other, self,"DIA_Pablo_Add_15_08"); //D'o� venaient les brigands qui avaient l'affiche me repr�sentant�?
	if (Pablo_belogen == TRUE)
	{
		AI_Output (self ,other,"DIA_Pablo_Add_12_09"); //Ah-ha�! C'est donc bien de vous qu'il s'agit�! Pourquoi ne pas l'avoir avou� d'embl�e, hein�?
		AI_Output (self ,other,"DIA_Pablo_Add_12_10"); //(ton imp�rieux) Pourquoi �tes-vous recherch�?
		AI_Output (other, self,"DIA_Pablo_Add_15_11"); //Je n'en sais rien, promis�!
		AI_Output (self ,other,"DIA_Pablo_Add_12_12"); //Oui, oui, je sais. Laissez-moi juste vous dire quelque chose�: si je pensais que vous �tes de m�che avec ces brigands, je vous aurais d�j� jet� aux fers, pig�?
		AI_Output (self ,other,"DIA_Pablo_Add_12_13"); //Cela �tant, il va falloir que j'en parle au seigneur Andr�...
		Pablo_AndreMelden = TRUE;
		AI_Output (self ,other,"DIA_Pablo_Add_12_14"); //Mais pour r�pondre � votre question...
	};

	AI_Output (self ,other,"DIA_Pablo_Add_12_15"); //Nous les avons attrap� � c�t� de chez Onar, le propri�taire terrien.
	AI_Output (self ,other,"DIA_Pablo_Add_12_16"); //Sauf qu'ils ne ressemblent pas � ceux qui travaillent pour lui.
	AI_Output (self ,other,"DIA_Pablo_Add_12_17"); //A mon avis, ils font partie d'un plus petit groupe, qui se terre dans les montagnes non loin de la ferme d'Onar.
	AI_Output (self ,other,"DIA_Pablo_Add_12_18"); //Si vous avez l'intention de vous y rendre, je vous pr�viens, ces coupe-jarrets massacrent tous ceux qui croisent leur route.
	AI_Output (other, self,"DIA_Pablo_Add_15_19"); //Je m'en souviendrai.
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pablo_Perm   (C_INFO)
{
	npc         = Mil_319_Pablo;
	nr          = 1;
	condition   = DIA_Pablo_Perm_Condition;
	information = DIA_Pablo_Perm_Info;
	permanent   = TRUE;
	description = "Comment �a se passe ?";
};
FUNC INT DIA_Pablo_Perm_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Pablo_Perm_Info()
{
	AI_Output (other, self, "DIA_Pablo_Perm_15_00"); //Comme �a va ?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_01"); //J'ai toujours dit qu'il �tait impossible de faire confiance � ces mercenaires.
				AI_Output (self, other, "DIA_Pablo_Perm_12_02"); //Il est grand temps que nous donnions une bonne le�on � cette racaille. Bennet n'a pas pu concevoir tout �a tout seul.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_03"); //Je suis tr�s affect� par le meurtre du paladin Lothar.
				AI_Output (self, other, "DIA_Pablo_Perm_12_04"); //Mais je sais que l'Eglise ch�tiera le malfaisant qui a commis ce crime.
			}
			else
			{
				AI_Output (self, other, "DIA_Pablo_Perm_12_05"); //Que faites-vous � r�der par ici�? Si vous cherchez � lib�rer votre ami mercenaire, n'y pensez m�me pas.
			};
		}
		else //Bennet ist unschuldig
		{
			AI_Output (self, other, "DIA_Pablo_Perm_12_06"); //C'est path�tique ! Ils essayent d�sormais de nous dresser les uns contre les autres.
			AI_Output (self, other, "DIA_Pablo_Perm_12_07"); //Si vous n'aviez pas r�ussi � trouver le v�ritable coupable, les orques n'auraient m�me pas eu besoin de lever le petit doigt.
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_08"); //Je suis inquiet � l'id�e de ce qui pourrait se passer si les paladins s'en allaient maintenant.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_09"); //Comptez sur nous pour utiliser tous les moyens mis � notre disposition afin de veiller � ce que la ville ne se transforme pas en lieu de perdition.
	}
	else if (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_10"); //Mesurez vos faits et gestes. Nous surveillons �troitement les gredins tels que vous, par ici.
	}
	else
	{
		AI_Output (self, other, "DIA_Pablo_Perm_12_11"); //C'est calme en ce moment. Seuls les brigands vivant � l'ext�rieur de la ville nous causent des probl�mes.
	};	

}; 


