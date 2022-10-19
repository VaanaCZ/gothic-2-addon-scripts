// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Samuel_EXIT(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 999;
	condition	= DIA_Addon_Samuel_EXIT_Condition;
	information	= DIA_Addon_Samuel_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Samuel_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
instance DIA_Addon_Samuel_Hello(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 1;
	condition	= DIA_Addon_Samuel_Hello_Condition;
	information	= DIA_Addon_Samuel_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Samuel_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Samuel_Hello_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Samuel_Hello_14_00"); //Ah, un nouveau visage !
	AI_Output (self ,other, "DIA_Addon_Samuel_Hello_14_01"); //Qu'est-ce que vous voulez - du rhum, ou quelque chose de plus fort ?
	
	Log_CreateTopic (Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 			  				Francis
// ************************************************************
instance DIA_Addon_Samuel_Francis(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 2;
	condition	= DIA_Addon_Samuel_Francis_Condition;
	information	= DIA_Addon_Samuel_Francis_Info;

	description	= "Je veux vous parler de Francis.";
};                       
FUNC INT DIA_Addon_Samuel_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};

FUNC VOID DIA_Addon_Samuel_Francis_Info()
{	
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_00"); //Je veux vous parler de Francis.
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_01"); //Ne me parlez pas de ce capitaine de pacotille ! 
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_02"); //Il passe la journée assis sur son gros séant en faisant semblant d'être quelqu'un.
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_03"); //Chacun de nous se demande à quoi pouvait bien penser le capitaine lorsqu'il lui a remis les clefs de ce camp !
	AI_Output (self, other, "DIA_Addon_Samuel_Francis_14_04"); //Que voulez-vous savoir sur ce verrat ?
};

// ************************************************************
// 			  		In Gregs Hütte (Versteck)
// ************************************************************
instance DIA_Addon_Samuel_Versteck(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 3;
	condition	= DIA_Addon_Samuel_Versteck_Condition;
	information	= DIA_Addon_Samuel_Versteck_Info;

	description	= "Je dois entrer dans la cabane de Greg.";
};                       
FUNC INT DIA_Addon_Samuel_Versteck_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Samuel_Francis))
	&& (Francis_ausgeschissen == FALSE)
	&& (GregIsBack == FALSE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Samuel_Versteck_Info()
{	
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_02"); //Je dois entrer dans la cabane de Greg.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_05"); //(sournois) Oh, vraiment ? Pour quoi faire ?
	AI_Output (other, self, "DIA_Addon_Samuel_Francis_15_01"); //J'ai besoin d'une armure de bandit.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_06"); //(rires) Francis n'acceptera JAMAIS de vous laisser entrer dans la cabane pour faucher les biens de Greg !
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_07"); //A moins que...
	AI_Output (other, self,	"DIA_Addon_Samuel_Francis_15_03"); //Oui ?
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_08"); //...vous n'ayez quelque chose dont il a vraiment besoin.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_09"); //Je sais que Francis a dissimulé quelque chose dans une mine abandonnée, dans le canyon.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_10"); //Autrefois, pendant qu'on faisait notre tour de garde, il s'est assoupi - comme d'habitude - et il en a parlé dans son sommeil.
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_11"); //Je n'ai aucune idée de ce qu'il y a enterré, mais si vous le trouvez, peut-être sera-ce suffisamment important pour qu'il vous laisser entrer dans la cabane du capitaine...
	AI_Output (self ,other, "DIA_Addon_Samuel_Francis_14_12"); //(content) Lorsque le capitaine rentrera et découvrira que certains de ses biens ont disparu, ce crétin de Francis va en prendre pour son grade !

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Samuel le contrebandier m'a parlé de l'existence d'une cache secrète de Francis dans une mine du canyon. Peut-être y trouverai-je quelque chose qui me permette d'entrer dans la cabane."); 
};

// ************************************************************
// 			  				Rezepte
// ************************************************************
var int Samuel_Knows_LousHammer;
var int Samuel_Knows_SchlafHammer;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Recipe(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 4;
	condition	= DIA_Addon_Samuel_Recipe_Condition;
	information	= DIA_Addon_Samuel_Recipe_Info;
	permanent	= TRUE;
	description = "J'ai une recette pour vous !";
};
func INT DIA_Addon_Samuel_Recipe_Condition()
{
	if ( (Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems (other, ITWr_Addon_Lou_Rezept) > 0) )
	|| ( (Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems (other, ITWr_Addon_Lou_Rezept2) > 0) )
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Samuel_Recipe_Info()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_15_00"); //J'ai une recette pour vous !
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_14_01"); //Excellent, faites-moi voir ça ! Quel genre de recette ?
	
	Info_ClearChoices (DIA_Addon_Samuel_Recipe);
	if (Samuel_Knows_LousHammer == FALSE) 
	&& (Npc_HasItems (other, ITWr_Addon_Lou_Rezept) > 0)
	{
		Info_AddChoice (DIA_Addon_Samuel_Recipe,"Marteau de Lou",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if (Samuel_Knows_SchlafHammer == FALSE)
	&& (Npc_HasItems (other, ITWr_Addon_Lou_Rezept2) > 0)
	{
		Info_AddChoice (DIA_Addon_Samuel_Recipe,"Double Marteau de Lou",DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};
func VOID DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices (DIA_Addon_Samuel_Recipe);
};
func VOID DIA_Addon_Samuel_Recipe_LousHammer ()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_LousHammer_15_00"); //Je la tiens de Snaf.
	B_GiveInvItems (other, self, ITWr_Addon_Lou_Rezept, 1);
	B_UseFakeScroll();
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04"); //Mais ç'a l'air infect - il faut que j'essaie ça tout de suite !
	
	B_GivePlayerXP (XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};
func VOID DIA_Addon_Samuel_Recipe_LousDoubleHammer ()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00"); //Attention - cette boisson est mortelle !
	B_GiveInvItems (other, self, ITWr_Addon_Lou_Rezept2, 1);
	B_UseFakeScroll();
	AI_Output (self ,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04"); //Vous me faites peur... mais je vais essayer malgré tout.
	
	B_GivePlayerXP (XP_Ambient);
	Samuel_Knows_SchlafHammer = TRUE;
};

// ************************************************************
// 			  	  				 Grog
// ************************************************************
var int Samuel_Grog_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Grog(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 5;
	condition	= DIA_Addon_Samuel_Grog_Condition;
	information	= DIA_Addon_Samuel_Grog_Info;
	permanent	= TRUE;
	description = "Je suis venu chercher ma ration de tafia ! (10 pièces d'or)";
};                       
FUNC INT DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Samuel_Grog_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Grog_15_00"); //Je suis venu chercher ma ration de tafia.
	if (B_GiveInvItems(other, self, itmi_gold, 10))
	{	
		if (Samuel_Grog_Varianz == 0)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_01"); //Vous autres ne faites rien sans vous abreuver de tafia, hein ? Bon, tenez.
			Samuel_Grog_Varianz = 1;
		}
		else if (Samuel_Grog_Varianz == 1)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_02"); //J'espère qu'il est buvable... Je n'ai plus d'eau potable, mais un peu d'eau croupie n'a jamais fait de mal à qui que ce soit, pas vrai ?
			Samuel_Grog_Varianz = 2;
		}
		else // (Samuel_Grog_Varianz == 2)
		{
			AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_03"); //Vous aurez autant de tafia que vous le voulez !
		};
		
		B_GiveInvItems (self,other,ItFo_Addon_Grog,1);
	}
	else //nicht genug Gold
	{
		AI_Output (self,other,"DIA_Addon_Samuel_Grog_14_04"); //Je la vends à un prix modique, mais je ne vous l'offre pas ! Allez d'abord vous trouver de l'or, mon garçon !
	};
};

// ************************************************************
// 			  	  				Rum
// ************************************************************
var int Samuel_Rum_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Rum(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 6;
	condition	= DIA_Addon_Samuel_Rum_Condition;
	information	= DIA_Addon_Samuel_Rum_Info;
	permanent	= TRUE;
	description = "Donnez-moi du rhum (30 pièces d'or)";
};                       
FUNC INT DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_Rum_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Rum_15_00"); //Donnez-moi du rhum !
	
	if (B_GiveInvItems (other,self, ItMi_Gold, 30))
	{
		if (Samuel_Rum_Varianz == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_01"); //Ah ! Le lait du marin ! Tenez !
			Samuel_Rum_Varianz = 1;
		}
		else if (Samuel_Rum_Varianz == 1)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_02"); //Le rhum aura peut-être un léger goût de poissons. Nous n'avons plus que des vieux tonneaux de harengs, ici... mais après tout, du rhum, c'est du rhum ! A la vôtre !
			Samuel_Rum_Varianz = 2;
		}
		else // (Samuel_Rum_Varianz == 2)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_03"); //Tenez.
		};
				
		B_GiveInvItems (self,other,ItFo_Addon_rum,1);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Rum_14_04"); //Vous n'avez pas assez d'or, mon gars ! Vous voulez du tafia ?
	};		
};

// ************************************************************
// 			  	  			Was Stärkeres
// ************************************************************
var int Samuel_Stronger_Varianz;
var int Samuel_DoppelHammer_Varianz;
// ------------------------------------------------------------
instance DIA_Addon_Samuel_Stronger(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 7;
	condition	= DIA_Addon_Samuel_Stronger_Condition;
	information	= DIA_Addon_Samuel_Stronger_Info;
	permanent	= TRUE;
	description = "Je veux quelque chose de plus fort !";
};
                       
FUNC INT DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func VOID DIA_Addon_Samuel_Stronger_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_15_00"); //Je veux quelque chose de plus fort !
	
	if (Samuel_Stronger_Varianz == 0)
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_01"); //Ah, un téméraire ! Moi aussi, je suis toujours friand de nouvelles recettes !
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_02"); //Un bon alcool doit être transparent et fort, et doit brûler votre gorge comme du feu liquide.
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_03"); //Mais ça, vous n'en trouverez pas facilement. Mais je parle trop. Vous voulez à boire !
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_04"); //Tenez ! Ma propre recette ! Ça vous plaît ? Je l'ai appelée le 'Hareng pressé' !
		B_GiveInvItems (self,other,ItFo_Addon_Schnellerhering,1);
		B_UseItem (other, ItFo_Addon_Schnellerhering);
		AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_15_05"); //Impressionnant !
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_06"); //(rires) Ça, vous pouvez le dire ! 
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_07"); //A tout hasard, vous ne connaîtriez pas une bonne recette d'alcool ? Si c'est le cas, il faut que vous me la donniez !
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_08"); //Vous en voulez un autre ?
		Samuel_Stronger_Varianz = 1;
	}
	else // (Samuel_Stronger_Varianz == 1)
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_14_09"); //Qu'est-ce que vous prendrez ?
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Double Marteau de Lou (60 pièces d'or)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Marteau de Lou (30 pièces d'or)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Hareng pressé (30 pièces d'or)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
// ------------------------------------------------------------
func void B_Addon_Samuel_NoGold()
{
	AI_Output (self, other, "DIA_Addon_Samuel_NoGold_14_00"); //Pas d'or, pas de boisson !
};
// ------------------------------------------------------------

func VOID DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
};
func VOID DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00"); //Donnez-moi un Hareng pressé.
	if (B_GiveInvItems (other,self, ItMi_Gold, 30))
	{
		AI_Output (self ,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01"); //Plutôt fangeux, mais efficace !
		B_GiveInvItems (self, other, ItFo_Addon_SchnellerHering, 1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Double Marteau de Lou (60 pièces d'or)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Marteau de Lou (30 pièces d'or)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Hareng pressé (30 pièces d'or)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
func VOID DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_LousHammer_15_00"); //Je veux un Marteau de Lou !
	if (B_GiveInvItems (other, self, ItMi_Gold, 30))
	{
		AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01"); //Bon choix ! Allez, glissez-vous ça derrière le plastron !
		B_GiveInvItems (self,other,ItFo_Addon_LousHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Double Marteau de Lou (60 pièces d'or)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Marteau de Lou (30 pièces d'or)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Hareng pressé (30 pièces d'or)", DIA_Addon_Samuel_Stronger_SchnellerHering);
};
func VOID DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output (other,self ,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00"); //(détendu) Mettez-moi un double. Un double Marteau.
	if (B_GiveInvItems (other,self,ItMi_Gold,Value_SchlafHammer))
	{
		if (Samuel_DoppelHammer_Varianz == 0)
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01"); //N'allez pas faire quelque chose que vous pourriez regretter, mon garçon. J'espère que ce n'est pas pour vous?
		}
		else
		{
			AI_Output (self ,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02"); //(surexcité) Si ! Rien de tel pour vous redonner le moral !
		};

		B_GiveInvItems (self,other,ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	
	Info_ClearChoices (DIA_Addon_Samuel_Stronger);
	Info_AddChoice (DIA_Addon_Samuel_Stronger, DIALOG_BACK, DIA_Addon_Samuel_Stronger_Back);
	if (Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Double Marteau de Lou (60 pièces d'or)", DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};		
	if (Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice (DIA_Addon_Samuel_Stronger, "Marteau de Lou (30 pièces d'or)", DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice (DIA_Addon_Samuel_Stronger, "Hareng pressé (30 pièces d'or)", DIA_Addon_Samuel_Stronger_SchnellerHering);	
};

// ************************************************************
// 			  				 Trade 
// ************************************************************
instance DIA_Addon_Samuel_Trade(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 8;
	condition	= DIA_Addon_Samuel_Trade_Condition;
	information	= DIA_Addon_Samuel_Trade_Info;
	permanent	= TRUE;
	description	= "Qu'est-ce que vous avez d'autre ?";
	Trade		= TRUE;
};                       
FUNC INT DIA_Addon_Samuel_Trade_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Samuel_Trade_Info()
{	
	B_GiveTradeInv (self);

	Npc_RemoveInvItems	(self, ItFo_Addon_Grog, Npc_HasItems (self,ItFo_Addon_Grog) );
	CreateInvItems 	(self, ItFo_Addon_Grog, 15);
	
	AI_Output (other,self ,"DIA_Addon_Samuel_Trade_15_00"); //Qu'est-ce que vous avez d'autre ?
	AI_Output (self ,other,"DIA_Addon_Samuel_Trade_14_01"); //Je peux vous avoir tout ce dont un pirate peut avoir besoin pour survivre.
};

// ************************************************************
// 			  	Was gibt's neues im Lager	(PERM)
// ************************************************************
instance DIA_Addon_Samuel_News(C_INFO)
{
	npc			= PIR_1351_Addon_Samuel;
	nr			= 99;
	condition	= DIA_Addon_Samuel_News_Condition;
	information	= DIA_Addon_Samuel_News_Info;
	permanent	= TRUE;
	description	= "Quelles nouvelles du camp ?";
};                       
FUNC INT DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Samuel_News_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Samuel_News_15_00"); //Quoi de neuf au camp ?
	
	if (Npc_IsDead (Francis))
	|| (Francis_ausgeschissen == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Samuel_News_14_01"); //Francis a eu ce qu'il méritait ! Je peux pas vous dire à quel point ça me fait plaisir.
		AI_Output (self, other, "DIA_Addon_Samuel_News_14_02"); //Ça, c'est bien vrai ! Allez, allons boire un coup - c'est pour moi !
		if (GregIsBack == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_Samuel_News_14_03"); //Et Greg est enfin rentré. Il a perdu son navire, mais au moins, il rétablira l'ordre dans le camp.
		};
	}
	else //Greg noch weg UND Francis lebt noch
	{
		if (!Npc_IsDead (Morgan))
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_News_14_04"); //Il ne se passe plus grand-chose depuis le départ de Greg. Morgan et la plupart de ses gars passent leurs journées à se la couler douce en se soûlant.
		};
		if (!Npc_IsDead (Henry))
		{
			AI_Output (self ,other,"DIA_Addon_Samuel_News_14_05"); //Le seul qui fasse quoi que ce soit, c'est Henry. Lui et ses gars son en train de construire la palissade.
		};
		AI_Output (self ,other,"DIA_Addon_Samuel_News_14_06"); //Il est grand temps que le cap'taine Greg rentre et donne un grand coup de pied au cul à ce verrat de Francis !
	};
};
