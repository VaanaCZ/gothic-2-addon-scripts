///////////////////////////////////////////////////////////////////////
//	Info hello
///////////////////////////////////////////////////////////////////////
instance DIA_Schwarzmagier_HELLO		(C_INFO)
{
	npc		 = 	DMT_1299_OberDementor_DI;
	nr		 = 	5;
	condition	 = 	DIA_Schwarzmagier_HELLO_Condition;
	information	 = 	DIA_Schwarzmagier_HELLO_Info;
	important	 = 	TRUE;
};

func int DIA_Schwarzmagier_HELLO_Condition ()
{
	return TRUE;
};
var int SC_KnowsMadPsi;		
func void DIA_Schwarzmagier_HELLO_Info ()
{
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_00"); //Alors, ver visqueux, vous osez vous présenter devant les portes du maître ?
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_01"); //Etes-vous celui qui tire les ficelles ?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_02"); //Je suis le gardien des Halls d'Irdorath. La source la plus puissante du pouvoir terrestre de Béliar. Mes mains détiennent la force divine de mon maître.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_09_03"); //Un seul mot de moi et vous sombrerez dans la folie éternelle.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_15_04"); //Je vois. Je crois que je vais encore devoir me débarrasser d'un homme de main.
	
	B_LogEntry (TOPIC_HallenVonIrdorath,"Je suis à la dernière porte. Le magicien noir semble en être la clef."); 

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Amenez-moi auprès de votre maître.", DIA_Schwarzmagier_HELLO_meister );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Combien de membres de votre espèce devrai-je encore tuer ?", DIA_Schwarzmagier_HELLO_dmt );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Qu'est-ce qui est dissimulé derrière ce grand portail ?", DIA_Schwarzmagier_HELLO_hinterTor );
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Qui est votre maître ?", DIA_Schwarzmagier_HELLO_wer );

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice	(DIA_Schwarzmagier_HELLO, "Vous étiez un suivant du Dormeur.", DIA_Schwarzmagier_HELLO_schlaefer );
	};
};
func void DIA_Schwarzmagier_HELLO_wer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_00"); //Qui est votre maître ?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_01"); //Il est celui qui erre entre les mondes. Sa sagesse divine nous illumine.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_02"); //Il est l'élu de Béliar qui libérera le royaume des misérables serviteurs d'Innos.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_wer_09_03"); //Il apporte la mort à ceux qui doutent de sa grandeur.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_wer_15_04"); //Ça me rappelle quelque chose.

};

func void DIA_Schwarzmagier_HELLO_hinterTor ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_hinterTor_15_00"); //Qu'est-ce qui se trouve derrière l'énorme portail là-bas ?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_hinterTor_09_01"); //(rire) Les appartements de mon seigneur vous sont inaccessibles. Vous n'aurez pas l'occasion d'en ouvrir les portes.

};
func void DIA_Schwarzmagier_HELLO_schlaefer ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_schlaefer_15_00"); //Vous étiez un adepte du Dormeur.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_01"); //C'était il y a longtemps. Le maître nous a ouvert les yeux. Plus personne ne peut plus nous arrêter désormais.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_schlaefer_09_02"); //Le maître nous a montré le seul moyen de disposer de vous, mécréants.

	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Schwarzmagier_HELLO_dmt ()
{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_00"); //Combien de membres de votre espèce devrai-je encore tuer ?
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_01"); //Nous sommes nombreux. Vous n'avez pas la moindre idée du nombre de gens qui attendent ces temps de libération.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_02"); //Des larmes de lamentation noieront les terres quand nous sortirons au grand jour.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_dmt_09_03"); //Pour libérer le monde des barbares qui se font appeler les gardiens du feu. Notre rassemblement dans ce temple n'est que temporaire.
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_dmt_15_04"); //Oui.
};

func void DIA_Schwarzmagier_HELLO_meister ()
{
	Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );
	Wld_PlayEffect("spellFX_INCOVATION_RED",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
	Wld_PlayEffect("SFX_Circle",  self, self, 0, 0, 0, FALSE );
	AI_PlayAni (self,"T_PRACTICEMAGIC5");	
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_00"); //(menaçant) Assez de sottises ! Je vais vous anéantir.
	AI_Output			(self, other, "DIA_Schwarzmagier_HELLO_meister_09_01"); //Vous allez disparaître et votre esprit se perdra dans les ténèbres.

	if (Npc_HasItems (other,ItAm_Prot_BlackEye_Mis))
	{
	AI_Output			(other, self, "DIA_Schwarzmagier_HELLO_meister_15_02"); //(à lui-même) Sans cette amulette de convocation des âmes, j'aurais un sérieux problème.
	}
	else
	{
		hero.attribute[ATR_MANA] = 0;
		
		if (hero.attribute[ATR_HITPOINTS] > 50)
			{
				hero.attribute[ATR_HITPOINTS] = ((hero.attribute[ATR_HITPOINTS])/2);
			};
		
		SC_ObsessionCounter = 100;
		B_SCIsObsessed (hero);
	};

	Info_ClearChoices	(DIA_Schwarzmagier_HELLO);
	Info_AddChoice	(DIA_Schwarzmagier_HELLO, DIALOG_ENDE, DIA_Schwarzmagier_HELLO_back );

};

func void DIA_Schwarzmagier_HELLO_back ()
{
	AI_StopProcessInfos (self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play 	("MFX_FEAR_CAST" );
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
};



