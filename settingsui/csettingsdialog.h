#ifndef CSETTINGSDIALOG_H
#define CSETTINGSDIALOG_H

#include "utils/compiler_warnings_control.h"

DISABLE_COMPILER_WARNINGS
#include <QDialog>
RESTORE_COMPILER_WARNINGS

#include <vector>

namespace Ui {
class CSettingsDialog;
}

class QListWidgetItem;

class CSettingsDialog : public QDialog
{
	Q_OBJECT

public:
	explicit CSettingsDialog(QWidget *parent = 0);
	~CSettingsDialog();

	void addSettingsPage(QWidget * page, const QString& pageName = QString());

signals:
	void settingsChanged();

private slots:
	void pageChanged(QListWidgetItem *item);
	virtual void accept() override;

private:
	Ui::CSettingsDialog *ui;
};

#endif // CSETTINGSDIALOG_H
