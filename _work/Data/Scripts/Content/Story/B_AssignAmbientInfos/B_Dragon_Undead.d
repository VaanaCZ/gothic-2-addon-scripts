// -------------------------------------------------------------------------
// Nicos Satz
// -------------------------------------------------------------------------
func void B_Dragon_Undead_Bla()
{
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_00"); //Alors, gamin ? Vous vous �tes procur� un original ?
};

// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Exit(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 999;
	condition	= DIA_Dragon_Undead_Exit_Condition;
	information	= DIA_Dragon_Undead_Exit_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dragon_Undead_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Dragon_Undead_Exit_Info()
{	
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
INSTANCE DIA_Dragon_Undead_Hello(C_INFO)
{
	
	npc 		= Dragon_Undead;
	nr			= 5;
	condition	= DIA_Dragon_Undead_Hello_Condition;
	information	= DIA_Dragon_Undead_Hello_Info;

	important 	= TRUE;
};                       

FUNC INT DIA_Dragon_Undead_Hello_Condition()
{
	if (Npc_HasItems (other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Dragon_Undead_Hello_Info()
{	
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_00"); //Vous avez enfin r�ussi � me trouver. J'ai trop attendu votre venue.
	AI_Output (other, self, "DIA_Dragon_Undead_Hello_15_01"); //Allez. Cessez de pr�tendre que vous aviez tout maniganc� depuis le d�but.
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_02"); //(rires sinistres) Que savez-vous de mes intentions ?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_03"); //Ne vous ai-je pas envoy� les Traqueurs pour vous attirer sur ma piste ?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_04"); //N'ai-je pas fait en sorte que les preuves de mon existence soient si �videntes que vous ne puissiez pas les ignorer ?

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_05"); //Et les �ufs de dragons n'ont-ils pas jou� un r�le majeur dans la fabrication de votre armure qui vous a permis d'arriver jusqu'� moi ?
	};

	if (hero.guild == GIL_PAL)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_06"); //La d�ch�ance des paladins n'�tait-elle pas une raison suffisante pour que vous tentiez de d�couvrir qui en �tait l'instigateur ?
	};

	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_07"); //Les poss�d�s n'�taient-ils pas une raison suffisante pour que vous tentiez de d�couvrir quelle �tait leur origine ?
	};

	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_08"); //Vous ne pouvez pas nier ces faits.
	
	//ADDON
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_01"); //Il n'y a qu'une seule chose que je n'avais pas pr�vue ! 
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_02"); //Vous avez an�anti l'un de mes serviteurs ! Il avait �t� choisi pour porter la Griffe.
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_03"); //Et � ce que je vois, c'est vous qui la portez. Vous mourrez pour cet affront !
	
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Assez parl�.", DIA_Dragon_Undead_Hello_attack );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Et au nom de qui menez-vous vos serviteurs � la guerre contre les humains ?", DIA_Dragon_Undead_Hello_Auftraggeber );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Pourquoi �tes-vous ici ?", DIA_Dragon_Undead_Hello_warum );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Qui �tes-vous ?", DIA_Dragon_Undead_Hello_wer );

	B_LogEntry (TOPIC_HallenVonIrdorath,"L'ennemi est un dragon mort-vivant. Je dois le tuer avant de pouvoir quitter cette �le maudite."); 
};
func void DIA_Dragon_Undead_Hello_wer ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_00"); //Qui �tes-vous ?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_01"); //(rires) Vous avez encore besoin de le demander ? Cherchez en vous-m�me, idiot. Vous savez qui je suis.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_02"); //Comme vous, je n'ai pas de nom.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_03"); //Je d�tiens le pouvoir divin de mon cr�ateur comme votre dieu vous a accord� le sien.

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_04"); //Mon destin est d'an�antir le monde.
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_05"); //Tout comme votre destin�e est d�termin�e par l'int�grit� et la vertu d'un paladin.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_06"); //Tout comme vos mains apportent la mort, chasseur de dragons.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_07"); //Tout comme le pr�che des enseignements d'Innos est votre raison de vivre, magicien du feu.
		};

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_08"); //Ne ressentez-vous pas le lien qui nous unit ? Oui. Vous savez qui je suis.
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_09"); //(d�sorient�) Non. Cela ne se peut. Xardas a toujours dit...
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_10"); //Xardas est faible et il n'est pas une menace. Vous seul �tes digne de m'affronter.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_11"); //C'est �crit. Le temps est venu d'accepter votre destin�e.
	
	

};

func void DIA_Dragon_Undead_Hello_warum ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_warum_15_00"); //Pourquoi �tes-vous ici ?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_01"); //La part de divin qui m'a �t� accord�e m'inspire pour plonger le monde dans un oc�an de violence.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_02"); //Ce n'est que lorsque la derni�re forteresse des vertueux sera tomb�e que je trouverai le repos.

};

func void DIA_Dragon_Undead_Hello_Auftraggeber ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_Auftraggeber_15_00"); //Au nom de qui menez-vous vos fid�les dans cette guerre contre l'humanit� ?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_01"); //Mon ma�tre est le Seigneur de la nuit. Vous le connaissez. Vous entendez son appel.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_03"); //Mes arm�es jailliront de la terre en son nom et plongeront le monde dans les t�n�bres.
};

func void DIA_Dragon_Undead_Hello_attack ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_attack_15_00"); //Assez parl�. Je vais vous renvoyer ramper sous le rocher d'o� vous �tes sorti, esp�ce de monstre.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_01"); //(rires) Vous n'�tes pas pr�t pour me vaincre. Encore un instant et j'aurai atteint mon objectif.
	//ADDON
	if (C_ScHasEquippedBeliarsWeapon())
	|| (C_ScHasReadiedBeliarsWeapon())
	|| (C_ScHasBeliarsRune())
	{
		AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_04"); //Vous pensez vraiment pouvoir me blesser avec la Griffe ? (rires)
	};
	//ADDON ENDE
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_02"); //Vos os me serviront � faire souffler le vent de la mort sur le monde.
		
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};





