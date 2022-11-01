// -------------------------------------------------------------------------
// Nicos Satz
// -------------------------------------------------------------------------
func void B_Dragon_Undead_Bla()
{
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_00"); //Alors, gamin ? Vous vous êtes procuré un original ?
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
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_00"); //Vous avez enfin réussi à me trouver. J'ai trop attendu votre venue.
	AI_Output (other, self, "DIA_Dragon_Undead_Hello_15_01"); //Allez. Cessez de prétendre que vous aviez tout manigancé depuis le début.
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_02"); //(rires sinistres) Que savez-vous de mes intentions ?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_03"); //Ne vous ai-je pas envoyé les Traqueurs pour vous attirer sur ma piste ?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_04"); //N'ai-je pas fait en sorte que les preuves de mon existence soient si évidentes que vous ne puissiez pas les ignorer ?

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_05"); //Et les œufs de dragons n'ont-ils pas joué un rôle majeur dans la fabrication de votre armure qui vous a permis d'arriver jusqu'à moi ?
	};

	if (hero.guild == GIL_PAL)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_06"); //La déchéance des paladins n'était-elle pas une raison suffisante pour que vous tentiez de découvrir qui en était l'instigateur ?
	};

	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_07"); //Les possédés n'étaient-ils pas une raison suffisante pour que vous tentiez de découvrir quelle était leur origine ?
	};

	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_08"); //Vous ne pouvez pas nier ces faits.
	
	//ADDON
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_01"); //Il n'y a qu'une seule chose que je n'avais pas prévue ! 
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_02"); //Vous avez anéanti l'un de mes serviteurs ! Il avait été choisi pour porter la Griffe.
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_03"); //Et à ce que je vois, c'est vous qui la portez. Vous mourrez pour cet affront !
	
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Assez parlé.", DIA_Dragon_Undead_Hello_attack );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Et au nom de qui menez-vous vos serviteurs à la guerre contre les humains ?", DIA_Dragon_Undead_Hello_Auftraggeber );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Pourquoi êtes-vous ici ?", DIA_Dragon_Undead_Hello_warum );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Qui êtes-vous ?", DIA_Dragon_Undead_Hello_wer );

	B_LogEntry (TOPIC_HallenVonIrdorath,"L'ennemi est un dragon mort-vivant. Je dois le tuer avant de pouvoir quitter cette île maudite."); 
};
func void DIA_Dragon_Undead_Hello_wer ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_00"); //Qui êtes-vous ?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_01"); //(rires) Vous avez encore besoin de le demander ? Cherchez en vous-même, idiot. Vous savez qui je suis.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_02"); //Comme vous, je n'ai pas de nom.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_03"); //Je détiens le pouvoir divin de mon créateur comme votre dieu vous a accordé le sien.

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_04"); //Mon destin est d'anéantir le monde.
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_05"); //Tout comme votre destinée est déterminée par l'intégrité et la vertu d'un paladin.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_06"); //Tout comme vos mains apportent la mort, chasseur de dragons.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_07"); //Tout comme le prêche des enseignements d'Innos est votre raison de vivre, magicien du feu.
		};

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_08"); //Ne ressentez-vous pas le lien qui nous unit ? Oui. Vous savez qui je suis.
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_09"); //(désorienté) Non. Cela ne se peut. Xardas a toujours dit...
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_10"); //Xardas est faible et il n'est pas une menace. Vous seul êtes digne de m'affronter.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_11"); //C'est écrit. Le temps est venu d'accepter votre destinée.
	
	

};

func void DIA_Dragon_Undead_Hello_warum ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_warum_15_00"); //Pourquoi êtes-vous ici ?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_01"); //La part de divin qui m'a été accordée m'inspire pour plonger le monde dans un océan de violence.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_02"); //Ce n'est que lorsque la dernière forteresse des vertueux sera tombée que je trouverai le repos.

};

func void DIA_Dragon_Undead_Hello_Auftraggeber ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_Auftraggeber_15_00"); //Au nom de qui menez-vous vos fidèles dans cette guerre contre l'humanité ?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_01"); //Mon maître est le Seigneur de la nuit. Vous le connaissez. Vous entendez son appel.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_03"); //Mes armées jailliront de la terre en son nom et plongeront le monde dans les ténèbres.
};

func void DIA_Dragon_Undead_Hello_attack ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_attack_15_00"); //Assez parlé. Je vais vous renvoyer ramper sous le rocher d'où vous êtes sorti, espèce de monstre.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_01"); //(rires) Vous n'êtes pas prêt pour me vaincre. Encore un instant et j'aurai atteint mon objectif.
	//ADDON
	if (C_ScHasEquippedBeliarsWeapon())
	|| (C_ScHasReadiedBeliarsWeapon())
	|| (C_ScHasBeliarsRune())
	{
		AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_04"); //Vous pensez vraiment pouvoir me blesser avec la Griffe ? (rires)
	};
	//ADDON ENDE
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_02"); //Vos os me serviront à faire souffler le vent de la mort sur le monde.
		
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};





