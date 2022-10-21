// -------------------------------------------------------------------------
// Nicos Satz
// -------------------------------------------------------------------------
func void B_Dragon_Undead_Bla()
{
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_00"); //Na, mein Kleiner? Hast du denn auch eine Originalversion?
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
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_00"); //Nun hast du es also geschafft, mich zu finden. Allzu lange warte ich nun schon auf deine Ankunft.
	AI_Output (other, self, "DIA_Dragon_Undead_Hello_15_01"); //Komm schon. Tu doch nicht so, als hättest du das geplant.
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_02"); //(Lacht laut) Was weißt du denn schon von meinen Absichten?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_03"); //Habe ich dir nicht die Suchenden geschickt, um dich auf meine Fährte zu locken?
	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_04"); //Habe ich nicht die Zeichen meiner Existenz so sichtbar hinterlassen, dass du mich gar nicht verfehlen konntest?

	if (hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7)
	{
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_05"); //Haben die Dracheneier etwa nicht dazu beigetragen, dich zu rüsten, um zu mir zu gelangen?
	};

	if (hero.guild == GIL_PAL)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_06"); //Waren die bekehrten Paladine nicht genug Grund für dich, nach der treibenden Macht im Verborgenen zu suchen?
	};

	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Dragon_Undead_Hello_20_07"); //Waren die Besessenen deiner Art denn etwa nicht Grund genug für dich, nach der treibenden Macht im Verborgenen zu suchen?
	};

	AI_Output (self, other, "DIA_Dragon_Undead_Hello_20_08"); //So sehr du dich auch abwenden und winden magst, du wirst das alles nicht leugnen können.
	
	//ADDON
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_01"); //Es gibt nur EINE Sache, die nicht vorherbestimmt war! 
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_02"); //Du hast einen meiner Diener vernichtet! Er war dazu auserwählt, die Klaue zu tragen.
	AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_03"); //Wie ich sehe trägst du sie jetzt. Für diesen Frevel wirst du sterben!
	
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Genug der Worte.", DIA_Dragon_Undead_Hello_attack );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "In welchem Auftrag führst du deine Schergen in den Krieg gegen die Menschen?", DIA_Dragon_Undead_Hello_Auftraggeber );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Warum bist du hier?", DIA_Dragon_Undead_Hello_warum );
	Info_AddChoice	(DIA_Dragon_Undead_Hello, "Wer bist du?", DIA_Dragon_Undead_Hello_wer );

	B_LogEntry (TOPIC_HallenVonIrdorath,"Der Feind ist ein untoter Drache. Ich muß ihn töten, damit ich diese verfluchte Insel wieder verlassen kann."); 
};
func void DIA_Dragon_Undead_Hello_wer ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_00"); //Wer bist du?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_01"); //(lacht) Das fragst du noch? Kehre in dich, du Narr. Du weißt, wer ich bin.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_02"); //Ich trage keinen Namen. So wie du keinen Namen trägst.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_03"); //Ich erhalte die göttliche Kraft von meinem Schöpfer. So wie du die Kraft deines Gottes in dir trägst.

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_04"); //Mein Schicksal ist die Zerstörung der Welt.
	
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_05"); //So wie dein Schicksal von der Rechtschaffenheit und den Tugenden eines Paladins bestimmt wird.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_06"); //So wie auch deine Hand den sicheren Tod bringt, Drachenjäger.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_07"); //So wie die Verkündung des Glaubens an Innos deine Bestimmung ist, Magier des Feuers.
		};

	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_08"); //Spürst du nicht das Band, das uns verbindet? Ja. Du weißt, wer ich bin.
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_wer_15_09"); //(irritiert) Nein. Das kann nicht sein. Xardas hat immer gesagt ...
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_10"); //Xardas ist schwach und keine Bedrohung für mich. Nur du allein bist würdig, mir entgegenzutreten.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_wer_20_11"); //So steht es geschrieben. Die Zeit ist gekommen, dein Schicksal zu akzeptieren.
	
	

};

func void DIA_Dragon_Undead_Hello_warum ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_warum_15_00"); //Warum bist du hier?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_01"); //Die mir verliehene Göttlichkeit wird mich beflügeln, die Welt im Strom der Gewalt zu ertränken.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_warum_20_02"); //Erst wenn die letzte Festung der Rechtschaffenen gefallen ist, werde ich ruhen.

};

func void DIA_Dragon_Undead_Hello_Auftraggeber ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_Auftraggeber_15_00"); //In wessen Auftrag führst du deine Schergen in den Krieg gegen die Menschen?
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_01"); //Mein Gebieter ist der Herr der Nacht. Du kennst ihn. Du kannst seinen Ruf hören.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_Auftraggeber_20_03"); //In seinem Namen werden meine Heerscharen sich aus der Erde erheben und die Welt in Dunkelheit hüllen.
};

func void DIA_Dragon_Undead_Hello_attack ()
{
	AI_Output			(other, self, "DIA_Dragon_Undead_Hello_attack_15_00"); //Genug der Worte. Ich werde dich dorthin zurück jagen, wo du Ungetüm entkrochen bist.
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_01"); //(lacht) Du bist noch nicht bereit, mich zu besiegen. Nur noch ein kurzer Moment und ich habe mein Ziel erreicht.
	//ADDON
	if (C_ScHasEquippedBeliarsWeapon())
	|| (C_ScHasReadiedBeliarsWeapon())
	|| (C_ScHasBeliarsRune())
	{
		AI_Output (self, other, "DIA_Addon_UndeadDragon_Add_20_04"); //Glaubst du tatsächlich, du könntest mich mit der Klaue verletzen? (lacht)
	};
	//ADDON ENDE
	AI_Output			(self, other, "DIA_Dragon_Undead_Hello_attack_20_02"); //Deine Gebeine werden mir dienen, um der Welt den Atem des Todes zu bringen.
		
	Npc_RemoveInvItems (other,ItMi_InnosEye_MIS,1);
	CreateInvItems 	   (other,ItMi_InnosEye_Discharged_MIS,1);	 
	AI_StopProcessInfos	(self);
	DragonTalk_Exit_Free  = FALSE;
	self.flags =  0;
};





