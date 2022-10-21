// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Bodo_EXIT   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 999;
	condition   = DIA_Bodo_EXIT_Condition;
	information = DIA_Bodo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo (PERM) 
// ************************************************************
INSTANCE DIA_Bodo_Hallo   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 1;
	condition   = DIA_Bodo_Hallo_Condition;
	information = DIA_Bodo_Hallo_Info;
	permanent   = TRUE;
	description = "Comment ça va ?";
};
FUNC INT DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Hallo_Info()
{
	AI_Output (other, self, "DIA_Bodo_Hallo_15_00"); //Comment ça se passe ?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_01"); //La milice nous persécute depuis trop longtemps. Maintenant que les mercenaires sont avec nous, elle n'osera pas pointer le bout de son nez.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_02"); //Si le roi croit qu'il peut en faire à sa guise, nous ne l'acceptons plus.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_03"); //Bien. Si vous voyez des miliciens, collez-leur-en une de ma part, vous voulez bien ?
	};
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_04"); //Bien. Qu'Innos soit avec vous.
	};
			
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{	
		AI_Output (self, other, "DIA_Bodo_Hallo_12_05"); //Les troupes du roi ne sont pas vraiment les bienvenues à la ferme.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_06"); //Beaucoup de gens ici accepteront de vous parler malgré tout mais vous risquez de ne pas être très populaire.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
INSTANCE DIA_Bodo_Bauernaufstand   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 2;
	condition   = DIA_Bodo_Bauernaufstand_Condition;
	information = DIA_Bodo_Bauernaufstand_Info;
	permanent   = FALSE;
	description = "En ville, ils parlent d'une révolte de paysans !";
};
FUNC INT DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bauernaufstand_15_00"); //En ville, ils parlent d'une révolte paysanne !
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_01"); //C'est absurde. Nous ne faisons que défendre ce pour quoi nous avons tant travaillé.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_02"); //Il est vrai que la guerre se fait sur le dos des paysans. Mais Onar refuse de faire quoi que ce soit pendant que le roi nous saigne à blanc.
};

// ************************************************************
// 			  				   Bett
// ************************************************************
INSTANCE DIA_Bodo_Bett   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 3;
	condition   = DIA_Bodo_Bett_Condition;
	information = DIA_Bodo_Bett_Info;
	permanent   = FALSE;
	description = "Y a-t-il un endroit où je puisse me reposer dans le coin ?";
};
FUNC INT DIA_Bodo_Bett_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bett_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bett_15_00"); //Y a-t-il un endroit dans le coin où je puisse me reposer ?
	AI_Output (self, other, "DIA_Bodo_Bett_12_01"); //Si vous cherchez un endroit où dormir allez dans la grange. Mais ne vous affalez pas par erreur sur le lit d'un mercenaire.
	AI_Output (self, other, "DIA_Bodo_Bett_12_02"); //Onar s'assure qu'ils nous laissent tranquilles mais, avec les étrangers qui n'appartiennent pas à la ferme, les mercenaires peuvent faire ce qu'ils veulent.
};

// ************************************************************
// 			  				   Cipher
// ************************************************************
INSTANCE DIA_Bodo_Cipher   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 4;
	condition   = DIA_Bodo_Cipher_Condition;
	information = DIA_Bodo_Cipher_Info;
	permanent   = FALSE;
	description = "Cipher dit que quelqu'un lui a volé un paquet d'herbes des marais.";
};
FUNC INT DIA_Bodo_Cipher_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	|| (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_Cipher_Info()
{
	AI_Output (other, self, "DIA_Bodo_Cipher_15_00"); //Cipher m'a dit que quelqu'un lui avait volé un paquet d'herbes...
	AI_Output (self, other, "DIA_Bodo_Cipher_12_01"); //Et ?
	AI_Output (other, self, "DIA_Bodo_Cipher_15_02"); //Il pense que c'est vous.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_03"); //Oh ! C'est pour ça qu'il me regarde avec cet air stupide.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_04"); //Je me suis montré extrêmement amical avec lui ces derniers temps car il semble avoir eu des problèmes.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_05"); //Mais je ne pouvais rien faire. Je voulais me montrer amical et lui, il me lançait des regards pleins de menaces.
};

// ************************************************************
// 			  				  WeedOrElse
// ************************************************************
INSTANCE DIA_Bodo_WeedOrElse   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 5;
	condition   = DIA_Bodo_WeedOrElse_Condition;
	information = DIA_Bodo_WeedOrElse_Info;
	permanent   = FALSE;
	description = "Donnez-moi cette herbe ou sinon...";
};
FUNC INT DIA_Bodo_WeedOrElse_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Bodo_Cipher))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_WeedOrElse_Info()
{
	AI_Output (other, self, "DIA_Bodo_WeedOrElse_15_00"); //Donnez-moi cette herbe ou sinon...
	AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_01"); //Ecoutez, je n'ai qu'un joint d'herbe. Prenez-le et fichez le camp.
	B_GiveInvItems (self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_02"); //Vous savez que les mercenaires d'Onar nous protègent, n'est-ce pas ?
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_03"); //Alors ne faites rien que vous puissiez regretter.
	};
};

// ************************************************************
// 			  				  WeedPERM
// ************************************************************
INSTANCE DIA_Bodo_WeedPERM   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 6;
	condition   = DIA_Bodo_WeedPERM_Condition;
	information = DIA_Bodo_WeedPERM_Info;
	permanent   = TRUE;
	description = "Je ne crois pas un mot de ce que vous dites. Donnez-moi l'herbe des marais !";
};
FUNC INT DIA_Bodo_WeedPERM_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Bodo_WeedOrElse))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_WeedPERM_Info()
{
	AI_Output (other, self, "DIA_Bodo_WeedPERM_15_00"); //Je ne crois pas un mot de ce que vous dites. Donnez-moi l'herbe des marais.
	AI_Output (self, other, "DIA_Bodo_WeedPERM_12_01"); //Je ne l'ai pas, promis.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bodo_PICKPOCKET (C_INFO)
{
	npc			= BAU_903_Bodo;
	nr			= 900;
	condition	= DIA_Bodo_PICKPOCKET_Condition;
	information	= DIA_Bodo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bodo_PICKPOCKET_Condition()
{
	C_Beklauen (30, 60);
};
 
FUNC VOID DIA_Bodo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bodo_PICKPOCKET);
	Info_AddChoice		(DIA_Bodo_PICKPOCKET, DIALOG_BACK 		,DIA_Bodo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bodo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bodo_PICKPOCKET_DoIt);
};

func void DIA_Bodo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bodo_PICKPOCKET);
};
	
func void DIA_Bodo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bodo_PICKPOCKET);
};













