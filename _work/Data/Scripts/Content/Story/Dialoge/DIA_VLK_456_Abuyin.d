// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Abuyin_EXIT(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 999;
	condition	= DIA_Abuyin_EXIT_Condition;
	information	= DIA_Abuyin_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Abuyin_EXIT_Condition()
{
	
	return TRUE;
};
FUNC VOID DIA_Abuyin_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Abuyin_PICKPOCKET (C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 900;
	condition	= DIA_Abuyin_PICKPOCKET_Condition;
	information	= DIA_Abuyin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Abuyin_PICKPOCKET_Condition()
{
	C_Beklauen (75, 200);
};
 
FUNC VOID DIA_Abuyin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Abuyin_PICKPOCKET);
	Info_AddChoice		(DIA_Abuyin_PICKPOCKET, DIALOG_BACK 		,DIA_Abuyin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Abuyin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Abuyin_PICKPOCKET_DoIt);
};

func void DIA_Abuyin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Abuyin_PICKPOCKET);
};
	
func void DIA_Abuyin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Abuyin_PICKPOCKET);
};
// ************************************************************
// 			  		Hallo
// ************************************************************
INSTANCE DIA_Abuyin_Hallo(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Hallo_Condition;
	information	= DIA_Abuyin_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       
FUNC INT DIA_Abuyin_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_00");//(überlegt) ... Merkwürdig. Es scheint mir so, als wäre ich dir schon einmal begegnet, Reisender ...
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_01");//Nun ... groß sind die Geheimnisse von Zeit und Raum ... Oh, verzeih mir meine Unhöflichkeit, Sohn der Geduld. Ich habe dich noch gar nicht begrüßt ...
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_02");//Willkommen Freund, nimm Platz auf meinen bescheidenen Teppichen und genieße in Ruhe eine Pfeife.
};
// ************************************************************
// 			  		Wer bist du?
// ************************************************************
INSTANCE DIA_Abuyin_du(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_du_Condition;
	information	= DIA_Abuyin_du_Info;
	permanent	= FALSE;
	description	= "Wer bist du?";
};                       
FUNC INT DIA_Abuyin_du_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Abuyin_du_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_du_15_00");//Wer bist du?
	AI_Output (self, other,"DIA_Abuyin_du_13_01");//Mein Name ist Abuyin ibn Djadir ibn Omar Kalid ben Hadji al Sharidi. Ich bin Seher und Weissager, Sterndeuter und Tabak-Anbieter.
};
// ************************************************************
// 			  		Kraut
// ************************************************************
INSTANCE DIA_Abuyin_Kraut(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Kraut_Condition;
	information	= DIA_Abuyin_Kraut_Info;
	permanent	= FALSE;
	description	= "Was für ein Kraut bietest du an?";
};                       
FUNC INT DIA_Abuyin_Kraut_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_du)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Kraut_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Kraut_15_00");//Was für ein Kraut bietest du an?
	AI_Output (self, other,"DIA_Abuyin_Kraut_13_01");//Meine Pfeifen sind gefüllt mit würzigem, erfrischenden Apfeltabak.
	AI_Output (self, other,"DIA_Abuyin_Kraut_13_02");//Du darfst dich jederzeit bedienen, Sohn der Abenteuer.
};
// ************************************************************
// 			  	anderen Tabak?
// ************************************************************
INSTANCE DIA_Abuyin_anderen(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_anderen_Condition;
	information	= DIA_Abuyin_anderen_Info;
	permanent	= FALSE;
	description	= "Hast du auch anderen Tabak? ";
};                       
FUNC INT DIA_Abuyin_anderen_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_Kraut)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_anderen_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_anderen_15_00");//Hast du auch anderen Tabak?
	AI_Output (self, other,"DIA_Abuyin_anderen_13_01");//Ich stelle nur den besten Tabak zu Verfügung. Diese Apfelmischung ist eine Sinfonie aus meiner Heimat, den südlichen Inseln.
	AI_Output (self, other,"DIA_Abuyin_anderen_13_02");//Aber natürlich bin ich jederzeit bereit, anderen Tabak auszuprobieren - sofern es jemandem gelingt, einen wirklich guten Tabak herzustellen.
	AI_Output (other, self,"DIA_Abuyin_anderen_15_03");//Wie geht das?
	AI_Output (self, other,"DIA_Abuyin_anderen_13_04");//Nimm als Grundlage meinen Apfeltabak. Und dann versuche, ihn mit einer anderen Zutat zu kombinieren.
	AI_Output (self, other,"DIA_Abuyin_anderen_13_05");//Das machst du an einem Labortisch, vorrausgesetzt, du beherrschst die Grundkenntnisse der Alchemie.
};
// ************************************************************
// 			  	Woher 
// ************************************************************
INSTANCE DIA_Abuyin_Woher(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Woher_Condition;
	information	= DIA_Abuyin_Woher_Info;
	permanent	= FALSE;
	description	= "Woher bekomme ich Apfeltabak?";
};                       
FUNC INT DIA_Abuyin_Woher_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_anderen)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Woher_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Woher_15_00");//Woher bekomme ich Apfeltabak?
	AI_Output (self, other,"DIA_Abuyin_Woher_13_01");//Zwei Portionen gebe ich dir, magst du damit in deiner Weisheit tun, was immer du willst.
	AI_Output (self, other,"DIA_Abuyin_Woher_13_02");//Wenn es dich nach mehr verlangt, dann lenke deine Schritte zu Zuris, dem Meister der Tränke. Er stellt diesen Tabak her und verkauft ihn auch.
	
	B_GiveInvItems (self, other, ItMi_ApfelTabak,2);
};
// ************************************************************
FUNC VOID B_TabakProbieren()
{
	AI_Output (self, other,"DIA_Abuyin_Mischung_Nichts_13_00");//Lass mich deinen Tabak probieren.
	CreateInvItems (self, ItMi_Joint,1);
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_Abuyin_Mischung_Nichts_13_01");//Nein, diese Mischung finde ich nicht sehr bekömmlich. Aber vielleicht findet sich ein anderer, der diesen ... äh ... Genuss zu schätzen weiß.
};
// ************************************************************
// 			  	Mischung 
// ************************************************************
INSTANCE DIA_Abuyin_Mischung(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 10;
	condition	= DIA_Abuyin_Mischung_Condition;
	information	= DIA_Abuyin_Mischung_Info;
	permanent	= TRUE;
	description	= "Ich habe eine neue Tabakmischung ...";
};                       
FUNC INT DIA_Abuyin_Mischung_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_anderen)
	&& (Abuyin_Honigtabak == FALSE)
	&& ((Npc_HasItems (other, ItMi_SumpfTabak) >= 1)
	|| (Npc_HasItems (other, ItMi_PilzTabak) >= 1)
	|| (Npc_HasItems (other, ItMi_DoppelTabak) >= 1)
	|| (Npc_HasItems (other, ItMi_Honigtabak) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Mischung_Info()
{	
	
	AI_Output (other, self,"DIA_Abuyin_Mischung_15_00");//Ich habe eine neue Tabakmischung ...
	
	Info_ClearChoices (DIA_Abuyin_Mischung);
	Info_AddChoice (DIA_Abuyin_Mischung,DIALOG_BACK,DIA_Abuyin_Mischung_BACK);
	
	if (Npc_HasItems (other, ItMi_SumpfTabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_KRAUT,DIA_Abuyin_Mischung_Sumpf);
	};
	if (Npc_HasItems (other, ItMi_PilzTabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_PILZ,DIA_Abuyin_Mischung_Pilz);
	};
	if (Npc_HasItems (other, ItMi_DoppelTabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_DOPPEL,DIA_Abuyin_Mischung_Doppel);
	};
	if (Npc_HasItems (other, ItMi_Honigtabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_HONIG,DIA_Abuyin_Mischung_Super);
	};
};	
FUNC VOID DIA_Abuyin_Mischung_BACK()
{
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Sumpf ()
{
	B_GiveInvItems (other, self, ItMi_SumpfTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Pilz ()
{
	B_GiveInvItems (other, self, ItMi_PilzTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Doppel ()
{
	B_GiveInvItems (other, self, ItMi_DoppelTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Super ()
{
	
	B_GiveInvItems (other, self, ItMi_Honigtabak, 1);
		
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_00");//Lass mich deinen Tabak probieren.
	CreateInvItems (self, ItMi_Joint,1);
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_01");//Das schmeckt ausgezeichnet! Etwas Besseres habe ich noch nie zuvor geraucht!
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_02");//Wie hast du diese Mischung hergestellt?
	AI_Output (other, self,"DIA_Abuyin_Mischung_Super_15_03");//Ich habe den Tabak mit Honig gemischt.
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_04");//Das hast du gut getan, Vater der Mischkunst. Es wäre mir eine Freude, wenn ich meine armseligen Pfeifen damit füllen könnte.
	AI_Output (other, self,"DIA_Abuyin_Mischung_Super_15_05");//Stopf du mal.
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_06");//Danke, Sohn der Großzügigkeit. Keine andere Mischung wäre so gut wie diese. Alles, was du mir davon bringst, werde ich dir abkaufen.
	
	Abuyin_Honigtabak = TRUE;
	B_GivePlayerXP ((XP_Ambient)*2);
	
	Info_ClearChoices (DIA_Abuyin_Mischung);
};	
// ************************************************************
// 			  Honigtabak verkaufen 
// ************************************************************
INSTANCE DIA_Abuyin_Trade(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Trade_Condition;
	information	= DIA_Abuyin_Trade_Info;
	permanent	= TRUE;
	description	= "Ich habe Honigtabak für dich.";
};                       
FUNC INT DIA_Abuyin_Trade_Condition()
{	
	if (Abuyin_Honigtabak == TRUE)
	&& (Npc_HasItems (other, ItMi_HonigTabak) >= 1) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Trade_Info()
{	
	Abuyin_Score = 0;
	
	Abuyin_Score = (Npc_HasItems (other, Itmi_Honigtabak)* Value_Itmi_Honigtabak);
	
	AI_Output (other, self,"DIA_Abuyin_Trade_15_00");//Ich habe Honigtabak für dich.
	
	B_GiveInvItems (other, self, ItmI_HonigTabak, Npc_HasItems (other, Itmi_Honigtabak));
	B_GiveInvItems (self, other, ItmI_Gold, Abuyin_Score);
	
	AI_Output (self, other,"DIA_Abuyin_Trade_13_01");//Es ist mir ein Vergnügen, mit dir Geschäfte zu machen.
};
// ************************************************************
// 			  		Herb - KrautPaket
// ************************************************************
INSTANCE DIA_Abuyin_Herb(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Herb_Condition;
	information	= DIA_Abuyin_Herb_Info;
	permanent	= FALSE;
	description	= "Hast du Interesse an diesem Krautpaket?";
};                       
FUNC INT DIA_Abuyin_Herb_Condition()
{	
	if (Npc_HasItems (other, Itmi_Herbpaket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Herb_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Herb_15_00");//Hast du Interesse an diesem Krautpaket?
	AI_Output (self, other,"DIA_Abuyin_Herb_13_01");//Ein Paket voller Kraut - doch nicht etwa Sumpfkraut? Oh, geh weg damit, Sohn der Unvorsichtigkeit!
	AI_Output (self, other,"DIA_Abuyin_Herb_13_02");//Wenn die Stadtwache mich damit erwischt, komme ich ins Gefängnis - und dir wird es nicht anders ergehen!
	AI_Output (self, other,"DIA_Abuyin_Herb_13_03");//Wenn du vorhast, das Zeug zu verkaufen, dann rate ich dir - verlasse die Stadt.
	AI_Output (self, other,"DIA_Abuyin_Herb_13_04");//Sieh zu, das du es irgendwo außerhalb der Stadtmauern loswirst! Hier drinnen ist Ärger das einzige, was du dafür bekommst.
};
// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung_Condition;
	information	= DIA_Abuyin_Weissagung_Info;
	permanent	= FALSE;
	description	= "Kannst du mir eine Weissagung geben?";
};                       
FUNC INT DIA_Abuyin_Weissagung_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Weissagung_15_00");//Kannst du mir eine Weissagung geben?
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_01");//Meine Dienste stehen dir für bescheidenen Lohn zur Verfügung, oh Vater der Großzügigkeit.
	AI_Output (other, self,"DIA_Abuyin_Weissagung_15_02");//Wie viel willst du haben?
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_03");//Für bescheidene 25 Münzen werde ich für dich einen Blick in die Zeit riskieren.
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_04");//Doch bedenke - die Zukunft ist immer ungewiss, und ich bin nur in der Lage, Bruchstücke aus der Zeit zu erfassen.
};
// ************************************************************
// 			Weisagen lassen Kapitel 1
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft_Condition;
	information	= DIA_Abuyin_Zukunft_Info;
	permanent	= TRUE;
	description	= "Erzähl mir von der Zukunft (25 Gold zahlen)";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung)
	&& (DIA_Abuyin_Zukunft_permanent == FALSE)
	&& (Kapitel == 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft_15_00");//Erzähl mir von der Zukunft.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 25)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft_13_01");//Gut, Suchender des Wissens. Ich werde mich nun in Trance begeben. Bist du bereit?
		Info_ClearChoices (DIA_Abuyin_Zukunft);
		Info_AddChoice (DIA_Abuyin_Zukunft,"Ich bin bereit",DIA_Abuyin_Zukunft_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft_13_02");//Oh Vater der Münzen, für einen Blick in die Zeit bitte ich dich um eine Gabe von 25 Goldstücken.
	};

};
FUNC VOID DIA_Abuyin_Zukunft_Trance()
{
		AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
		Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
		
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_00");//(Trance)... Orks ... sie bewachen einen Zugang ... ein alter Stollen ... das Tal der Minen ...
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_01");//(Trance) ... Männer mit strahlenden Rüstungen ... ein Magier ... dein Freund ist bei ihnen ... er wartet auf dich ...
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_02");//(Trance) ... Feuer! Ein Angriff ... ein mächtiges Wesen ... die Flammen ... viele ... werden sterben ...
		
		AI_Output (self, other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");//(Trance) ... was ist das ... ? Eine Stadt ... Ruinen ... Quarhodron in Jharkendar ...
		AI_Output (self, other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");//(Trance) ... er wird gerufen ... Quarhodron in Jharkendar!
		
		AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_03");//... Tut mir Leid - die Vision ist vorüber. Ich sehe nichts mehr.
		
		DIA_Abuyin_Zukunft_permanent = TRUE; 
		Abuyin_Zukunft = 1;
		Info_ClearChoices (DIA_Abuyin_Zukunft);
		
		B_GivePlayerXP ((XP_Ambient*4));
};
// ************************************************************
// 		Kannst du mir noch eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Nochmal(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Nochmal_Condition;
	information	= DIA_Abuyin_Nochmal_Info;
	permanent	= TRUE;
	description	= "Kannst du mir noch eine Weissagung geben?";
};                       
FUNC INT DIA_Abuyin_Nochmal_Condition()
{	
	if (Kapitel == Abuyin_Zukunft)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Nochmal_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Nochmal_15_00");//Kannst du mir noch eine Weissagung geben?
	AI_Output (self, other,"DIA_Abuyin_Nochmal_13_01");//Oh, Sohn der geheimnisvollen Zukunft, es ist mir nicht möglich, den Schleier der Zeit zu lüften.
	AI_Output (self, other,"DIA_Abuyin_Nochmal_13_02");//Erst wenn die Zeit mir ein weiteres Zeichen schenkt, kann ich wieder für dich sehen.
	
	if (Abuyin_Erzaehlt == FALSE)
	{
		AI_Output (other, self,"DIA_Abuyin_Nochmal_15_03");//Wann wird das sein?
		AI_Output (self, other,"DIA_Abuyin_Nochmal_13_04");//Wenn die Zukunft zur Gegenwart geworden ist und du deine Reise fortgesetzt hast.
		Abuyin_Erzaehlt = TRUE;
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

FUNC void B_Abuyin_Weissagung ()
{	
	AI_Output (other, self,"B_Abuyin_Weissagung_15_00");//Kannst du mir eine Weissagung geben?
	AI_Output (self, other,"B_Abuyin_Weissagung_13_01");//Ja, die Zeit ist voran geschritten und ich werde dir für ein paar Münzen eine Weissagung geben.
	AI_Output (other, self,"B_Abuyin_Weissagung_15_02");//Wie viel willst du?
};


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung2(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung2_Condition;
	information	= DIA_Abuyin_Weissagung2_Info;
	permanent	= FALSE;
	description	= "Kannst du mir eine Weissagung geben?";
};                       
FUNC INT DIA_Abuyin_Weissagung2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung2_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung2_13_00");//Für bescheidene 100 Münzen werde ich für dich einen Blick in die Zeit riskieren.
};
// ************************************************************
// 			Weisagen lassen Kapitel 2
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft2(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft2_Condition;
	information	= DIA_Abuyin_Zukunft2_Info;
	permanent	= TRUE;
	description	= "Erzähl mir von der Zukunft (100 Gold zahlen)";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft2_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung2)
	&& (DIA_Abuyin_Zukunft2_permanent == FALSE)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft2_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft2_15_00");//Erzähl mir von der Zukunft.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 100)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft2_13_01");//Gut, Sohn der Tapferkeit. Ich werde mich nun in Trance begeben. Bist du bereit?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft2);
		Info_AddChoice (DIA_Abuyin_Zukunft2,"Ich bin bereit.",DIA_Abuyin_Zukunft2_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft2_13_02");//Oh Vater der Münzen, für einen Blick in die Zeit bitte ich dich um eine Gabe von 100 Goldstücken.
	};

};	
FUNC VOID DIA_Abuyin_Zukunft2_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_00");//(TRANCE) ... Ein Söldner ... er wird dich brauchen ... ein schrecklicher Mord ... das Auge ...
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_01");//(TRANCE) ... die finsteren Schergen ... sie kommen ...sie suchen nach dir ... ein Wächter wird fallen ...
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_02");//(TRANCE) ... doch werden sich die drei vereinigen ... erst dann wirst du erhalten, was dir zusteht ...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_03");//Das war alles. Mehr kann ich nicht sehen.
	
	DIA_Abuyin_Zukunft2_permanent = TRUE; 
	Abuyin_Zukunft = 2;
	Info_ClearChoices (DIA_Abuyin_Zukunft2);
	
	B_GivePlayerXP ((XP_Ambient*4));
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung3(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung3_Condition;
	information	= DIA_Abuyin_Weissagung3_Info;
	permanent	= FALSE;
	description	= "Kannst du mir eine Weissagung geben?";
};                       
FUNC INT DIA_Abuyin_Weissagung3_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 3)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung3_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung3_13_00");//Für bescheidene 250 Münzen werde ich für dich einen Blick in die Zeit riskieren.
};
// ************************************************************
// 			Weisagen lassen Kapitel 3
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft3(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft3_Condition;
	information	= DIA_Abuyin_Zukunft3_Info;
	permanent	= TRUE;
	description	= "Erzähl mir von der Zukunft (250 Gold zahlen)";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft3_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft3_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung3)
	&& (DIA_Abuyin_Zukunft3_permanent == FALSE)
	&& (Kapitel == 3)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft3_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft3_15_00");//Erzähl mir von der Zukunft.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 250)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft3_13_01");//Gut, Sohn des Wissens. Ich werde mich nun in Trance begeben. Bist du bereit?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft3);
		Info_AddChoice (DIA_Abuyin_Zukunft3,"Ich bin bereit.",DIA_Abuyin_Zukunft3_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft3_13_02");//Oh Vater der Münzen, für einen Blick in die Zeit bitte ich dich um eine Gabe von 250 Goldstücken.
	};

};	
FUNC VOID  DIA_Abuyin_Zukunft3_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_00");//(Trance) ... du wirst erzwingen ... was niemandem sonst bestimmt ...
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_01");//(Trance) ... über Glut und Schnee ... durch Eis und Flammen ...
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_02");//(Trance) ... Männer in fremden Rüstungen ... ein Sumpf ... Echsen ... sie erwarten dich.
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_03");//Das war alles. Mehr kann ich nicht sehen.
	
	DIA_Abuyin_Zukunft3_permanent = TRUE; 
	Abuyin_Zukunft = 3;
	Info_ClearChoices (DIA_Abuyin_Zukunft3);
	
	B_GivePlayerXP ((XP_Ambient*4));
};
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung4(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung4_Condition;
	information	= DIA_Abuyin_Weissagung4_Info;
	permanent	= FALSE;
	description	= "Kannst du mir eine Weissagung geben?";
};                       
FUNC INT DIA_Abuyin_Weissagung4_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 4)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung4_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung4_13_00");//Für bescheidene 500 Münzen werde ich für dich einen Blick in die Zeit riskieren.
};
// ************************************************************
// 			Weisagen lassen Kapitel 4
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft4(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft4_Condition;
	information	= DIA_Abuyin_Zukunft4_Info;
	permanent	= TRUE;
	description	= "Erzähl mir von der Zukunft (500 Gold zahlen)";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft4_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft4_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung4)
	&& (DIA_Abuyin_Zukunft4_permanent == FALSE)
	&& (Kapitel == 4)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft4_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft4_15_00");//Erzähl mir von der Zukunft.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 500)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft4_13_01");//Gut, Sohn des Wissens. Ich werde mich nun in Trance begeben. Bist du bereit?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft4);
		Info_AddChoice (DIA_Abuyin_Zukunft4,"Ich bin bereit.",DIA_Abuyin_Zukunft4_Trance);	
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft4_13_02");//Oh Vater der Münzen, für einen Blick in die Zeit bitte ich dich um eine Gabe von 500 Goldstücken.
	};

};
FUNC VOID DIA_Abuyin_Zukunft4_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_00");//(Trance) ... der Ort des Wissens ... ein anderes Land ... ein dunkler Ort weit entfernt ...
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_01");//(Trance) ... mutige Gefährten ...du wirst deine Wahl treffen ...
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_02");//(Trance) ... ein Tempel ... liegt dort einsam in Adanos' Reich ... verborgen im Nebel ...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_03");//Das war alles. Mehr kann ich nicht sehen.
	
	DIA_Abuyin_Zukunft4_permanent = TRUE; 
	Abuyin_Zukunft = 4;
	Info_ClearChoices (DIA_Abuyin_Zukunft4);
	
	B_GivePlayerXP ((XP_Ambient*4));
};
//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung5(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung5_Condition;
	information	= DIA_Abuyin_Weissagung5_Info;
	permanent	= FALSE;
	description	= "Kannst du mir eine Weissagung geben?";
};                       
FUNC INT DIA_Abuyin_Weissagung5_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 5)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung5_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung5_13_00");//Für bescheidene 1000 Münzen werde ich für dich einen Blick in die Zeit riskieren.
};
// ************************************************************
// 			Weisagen lassen Kapitel 5
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft5(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft5_Condition;
	information	= DIA_Abuyin_Zukunft5_Info;
	permanent	= TRUE;
	description	= "Erzähl mir von der Zukunft (1000 Gold zahlen)";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft5_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft5_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung5)
	&& (DIA_Abuyin_Zukunft5_permanent == FALSE)
	&& (Kapitel == 5)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft5_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft5_15_00");//Erzähl mir von der Zukunft.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 1000)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft5_13_01");//Gut, Sohn des Wissens. Ich werde mich nun in Trance begeben. Bist du bereit?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft5);
		Info_AddChoice (DIA_Abuyin_Zukunft5,"Ich bin bereit.",DIA_Abuyin_Zukunft5_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft5_13_02");//Oh Vater der Münzen, für einen Blick in die Zeit bitte ich dich um eine Gabe von 1000 Goldstücken.
	};

};
FUNC VOID DIA_Abuyin_Zukunft5_Trance ()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_00");//(Trance) ... Dunkelheit zieht über das Land ... das Böse wird triumphieren ...
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_01");//(Trance) ... der König wird den Krieg gegen die Orks verlieren ...
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_02");//(Trance) ... du wirst zurückkehren, aber du wirst keine Ruhe finden ...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_03");//Das war alles. Mehr kann ich nicht sehen.
		
	DIA_Abuyin_Zukunft5_permanent = TRUE; 
	Abuyin_Zukunft = 5;
	
	Info_ClearChoices (DIA_Abuyin_Zukunft5);
	
	B_GivePlayerXP ((XP_Ambient*4));
};

